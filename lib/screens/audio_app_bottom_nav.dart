import 'package:audio_app_2/managers/bottom_nav_manager.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/pages/downloaded_lessons_page.dart';
import 'package:audio_app_2/pages/home_page.dart';
import 'package:audio_app_2/pages/profile_page.dart';
import 'package:flutter/material.dart';

class AudioAppBottomNav extends StatefulWidget {
  const AudioAppBottomNav({super.key});

  @override
  State<AudioAppBottomNav> createState() => _AudioAppBottomNavState();
}

class _AudioAppBottomNavState extends State<AudioAppBottomNav> {
  final PageManager pageManager = PageManager();
  final BottomNavManager navManager = BottomNavManager();

  @override
  void dispose() {
    navManager.dispose();
    pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      // Home Page
      HomePage(pageManager: pageManager),
      // Download Page
      DownloadedLessonsPage(pageManager: pageManager),
      // Profile Page
      ProfilePage(),
    ];

    return ValueListenableBuilder(
      valueListenable: navManager.selectedIndex,
      builder: (context, selectedIndex, _) {
        return Scaffold(
          body: pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: navManager.onItemTapped,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.download),
                label: "Downloads",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
