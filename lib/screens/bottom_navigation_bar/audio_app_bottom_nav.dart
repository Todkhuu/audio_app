import 'package:audio_app_2/screens/bottom_navigation_bar/home/custom_app_bar.dart';
import 'package:audio_app_2/managers/bottom_nav_manager.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/pages/downloaded_lessons_page.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/pages/home_page.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/pages/lesson_page.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/pages/news_page.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/pages/profile_page.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/widgets/custom_bottom_navigation_bar.dart';
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
      HomePage(pageManager: pageManager),
      LessonPage(),
      NewsPage(),
      DownloadedLessonsPage(pageManager: pageManager),
    ];

    return ValueListenableBuilder<int>(
      valueListenable: navManager.selectedIndex,
      builder: (context, selectedIndex, _) {
        int displayIndex = selectedIndex;
        if (selectedIndex > 3) {
          displayIndex = selectedIndex - 1;
        }

        return Scaffold(
          appBar: const CustomAppBar(),
          body: selectedIndex == 3 ? Container() : pages[displayIndex],
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: selectedIndex,
            onItemTapped: (index) {
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
              } else {
                navManager.onItemTapped(index);
              }
            },
          ),
        );
      },
    );
  }
}
