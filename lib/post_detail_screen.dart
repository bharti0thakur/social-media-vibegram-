import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String username;

  const PostDetailScreen({
    super.key,
    required this.imageUrl,
    this.username = "flutter_dev",
  });

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  // State variables for interaction
  bool _isLiked = false;
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Posts",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- POST HEADER ---
            ListTile(
              leading: const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
              ),
              title: Text(
                widget.username,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              trailing: const Icon(Icons.more_vert, color: Colors.black),
            ),

            // --- MAIN POST IMAGE ---
            GestureDetector(
              onDoubleTap: () {
                setState(() {
                  _isLiked = true;
                });
              },
              child: Image.network(
                widget.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                // Error handling for network images
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    color: Colors.grey[200],
                    child: const Center(child: Icon(Icons.broken_image, size: 50)),
                  );
                },
              ),
            ),

            // --- ACTION BUTTONS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                children: [
                  // Like Button
                  IconButton(
                    icon: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: _isLiked ? Colors.red : Colors.black,
                      size: 28,
                    ),
                    onPressed: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                  ),
                  // Comment Button
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline, size: 26),
                    onPressed: () {
                      // Handle comments
                    },
                  ),
                  // Share Button
                  IconButton(
                    icon: const Icon(Icons.send_outlined, size: 26),
                    onPressed: () {
                      // Handle share
                    },
                  ),
                  const Spacer(),
                  // Save Button
                  IconButton(
                    icon: Icon(
                      _isSaved ? Icons.bookmark : Icons.bookmark_border,
                      size: 28,
                    ),
                    onPressed: () {
                      setState(() {
                        _isSaved = !_isSaved;
                      });
                    },
                  ),
                ],
              ),
            ),

            // --- LIKES & CAPTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isLiked ? "1,235 likes" : "1,234 likes",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "${widget.username} ",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: "Exploring the beauty of Flutter UI! 🚀 #coding #flutter",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "View all 15 comments",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "2 hours ago",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}