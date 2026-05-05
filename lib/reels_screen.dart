import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Reels", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined, color: Colors.white))],
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://picsum.photos/400/800?random=$index"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(radius: 15, backgroundColor: Colors.white),
                          const SizedBox(width: 10),
                          const Text("username", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          OutlinedButton(onPressed: () {}, child: const Text("Follow", style: TextStyle(color: Colors.white, fontSize: 12)))
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text("Check out this amazing view! #nature #reels", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 40,
                  right: 20,
                  child: Column(
                    children: [
                      Icon(Icons.favorite_border, color: Colors.white, size: 35),
                      Text("1.2k", style: TextStyle(color: Colors.white)),
                      SizedBox(height: 20),
                      Icon(Icons.chat_bubble_outline, color: Colors.white, size: 35),
                      Text("45", style: TextStyle(color: Colors.white)),
                      SizedBox(height: 20),
                      Icon(Icons.send_outlined, color: Colors.white, size: 35),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}