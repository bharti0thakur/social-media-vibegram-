import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  // Mock data for stories
  final List<String> storyImages = [
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1000&auto=format&fit=crop",
    "https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?q=80&w=1000&auto=format&fit=crop",
    "https://images.unsplash.com/photo-1501785888041-af3ef285b470?q=80&w=1000&auto=format&fit=crop",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemCount: storyImages.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // 1. THE ACTUAL STORY IMAGE
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(storyImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 2. TOP GRADIENT (To make white text readable)
              Container(
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // 3. OVERLAY CONTENT (Progress Bar & User Info)
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      // Linear Progress Indicators (The little bars at the top)
                      Row(
                        children: List.generate(
                          storyImages.length,
                              (i) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: LinearProgressIndicator(
                                value: i == index ? 1.0 : (i < index ? 1.0 : 0.0),
                                backgroundColor: Colors.white24,
                                valueColor: const AlwaysStoppedAnimation(Colors.white),
                                minHeight: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // User Info Row
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "username_here",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "12h",
                            style: TextStyle(color: Colors.white60, fontSize: 12),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // 4. BOTTOM INTERACTION (Reply)
              Positioned(
                bottom: 20,
                left: 15,
                right: 15,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Send message",
                            hintStyle: TextStyle(color: Colors.white60),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Icon(Icons.favorite_border, color: Colors.white, size: 28),
                    const SizedBox(width: 15),
                    const Icon(Icons.send_outlined, color: Colors.white, size: 28),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}