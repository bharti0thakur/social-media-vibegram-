import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'post_detail_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // 🔥 Get username from email
  String getUsername() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && user.email != null) {
      String email = user.email!;
      return email.split('@')[0]; // remove @gmail.com
    }
    return "User";
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,

      // 🔥 Drawer
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            const Divider(),

            // 🔥 LOGOUT BUTTON (FIXED)
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                Navigator.pop(context);

                await FirebaseAuth.instance.signOut();

                if (!context.mounted) return;

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          getUsername(), // 🔥 show username here
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
          )
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage:
                  NetworkImage("https://i.pravatar.cc/150?img=3"),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStat("12", "Posts"),
                      _buildStat("1.5k", "Followers"),
                      _buildStat("300", "Following"),
                    ],
                  ),
                )
              ],
            ),
          ),

          // Username again in bio
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              getUsername(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("Flutter Developer 🚀"),
          ),

          const SizedBox(height: 10),

          const Divider(),

          // Grid
          Expanded(
            child: GridView.builder(
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                String imageUrl = "https://picsum.photos/500?random=$index";
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PostDetailScreen(imageUrl: imageUrl),
                      ),
                    );
                  },
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Column _buildStat(String number, String label) {
    return Column(
      children: [
        Text(number,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}