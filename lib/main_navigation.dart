import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'reels_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {

  int _currentIndex = 0;

  final List<Widget> _pages = [

    const HomeScreen(),
    const SearchScreen(),
    const ReelsScreen(),
    const NotificationScreen(),
    const ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      /// PAGE SWITCHING
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,

        onTap: (index) {

          setState(() {

            _currentIndex = index;

          });

        },

        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Reels",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Notification",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

        ],
      ),
    );
  }
}
