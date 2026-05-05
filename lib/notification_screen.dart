import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Notifications", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=$index")),
            title: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: "user_$index ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: "liked your photo."),
                  TextSpan(text: " 2h", style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            ),
            trailing: Container(
              height: 40, width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://picsum.photos/50?random=$index"), fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}