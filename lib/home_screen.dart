import 'package:flutter/material.dart';
import 'message_page.dart'; // Ensure this file has: class MessagePage
import 'story_page.dart';   // Ensure this file has: class StoryPage

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock data for stories
  final List<String> stories = [
    "https://i.pravatar.cc/150?img=1",
    "https://i.pravatar.cc/150?img=2",
    "https://i.pravatar.cc/150?img=3",
    "https://i.pravatar.cc/150?img=4",
    "https://i.pravatar.cc/150?img=5",
    "https://i.pravatar.cc/150?img=6",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "VibeGram",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: 'Billabong', // If you have the font, otherwise default
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {
              // Navigating to the Message Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagePage(),
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ---------- STORIES SECTION ----------
            Container(
              height: 115,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryPage(),
                        ),
                      );
                    },
                    child: _buildStoryCircle(stories[index], index == 0),
                  );
                },
              ),
            ),

            /// ---------- POSTS LIST ----------
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildPost(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// UI Widget for individual Story Circle
  Widget _buildStoryCircle(String url, bool isFirst) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.purple, Colors.red, Colors.orange],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(url),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            isFirst ? "Your Story" : "user_$url".substring(30, 35),
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  /// UI Widget for individual Feed Post
  Widget _buildPost(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        ListTile(
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=$index"),
          ),
          title: Text(
            "username_$index",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          trailing: const Icon(Icons.more_vert),
        ),

        // Post Image
        Image.network(
          "https://picsum.photos/500/500?random=$index",
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        // Post Actions
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const Icon(Icons.favorite_border, size: 28),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline, size: 26),
              const SizedBox(width: 16),
              const Icon(Icons.send_outlined, size: 26),
              const Spacer(),
              const Icon(Icons.bookmark_border, size: 28),
            ],
          ),
        ),

        // Likes and Caption
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1,234 likes", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Row(
                children: [
                  Text("username ", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("This is a sample caption for the post..."),
                ],
              ),
              SizedBox(height: 5),
              Text("View all 15 comments", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}