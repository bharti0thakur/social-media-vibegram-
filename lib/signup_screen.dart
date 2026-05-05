import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialmediaapp/login_screen.dart';
import 'main_navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  // Email Validation Regex
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
        .hasMatch(email);
  }

  Future<void> _handleSignUp() async {
    FocusScope.of(context).unfocus(); // Close keyboard

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String username = usernameController.text.trim();

    // 🔴 Validation
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      showMessage("Please fill all fields");
      return;
    }

    if (!isValidEmail(email)) {
      showMessage("Enter a valid email address");
      return;
    }

    if (password.length < 6) {
      showMessage("Password must be at least 6 characters");
      return;
    }

    setState(() => isLoading = true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update username
      await userCredential.user?.updateDisplayName(username);
      await userCredential.user?.reload();

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print("Error Code: ${e.code}");
      print("Error Message: ${e.message}");

      String message = "Something went wrong";

      switch (e.code) {
        case 'invalid-email':
          message = "Invalid email format";
          break;
        case 'email-already-in-use':
          message = "Email already registered";
          break;
        case 'weak-password':
          message = "Password is too weak";
          break;
        case 'network-request-failed':
          message = "Check your internet connection";
          break;
        default:
          message = e.message ?? message;
      }

      showMessage(message);
    } catch (e) {
      showMessage(e.toString());
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            // Background
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(color: Colors.black.withOpacity(0.6)),

            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "VibeGram",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontFamily: "Billabong",
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Sign up to see photos and videos\nfrom your friends.",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 40),

                      _buildInput(usernameController, "Username"),
                      const SizedBox(height: 12),
                      _buildInput(emailController, "Email",
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 12),
                      _buildInput(passwordController, "Password",
                          isObscure: true),

                      const SizedBox(height: 25),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize:
                          const Size(double.infinity, 50),
                        ),
                        onPressed:
                        isLoading ? null : _handleSignUp,
                        child: isLoading
                            ? const CircularProgressIndicator(
                            color: Colors.white)
                            : const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          "Already have an account? Log In",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(
      TextEditingController controller,
      String hint, {
        bool isObscure = false,
        TextInputType keyboardType = TextInputType.text,
      }) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}