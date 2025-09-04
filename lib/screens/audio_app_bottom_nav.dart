import 'package:audio_app_2/managers/bottom_nav_manager.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/pages/downloaded_lessons_page.dart';
import 'package:audio_app_2/pages/home_page.dart';
import 'package:audio_app_2/pages/news_page.dart';
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
      HomePage(pageManager: pageManager),
      NewsPage(),
      DownloadedLessonsPage(pageManager: pageManager),
      ProfilePage(),
    ];

    return ValueListenableBuilder(
      valueListenable: navManager.selectedIndex,
      builder: (context, selectedIndex, _) {
        return Scaffold(
          body: pages[selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Color(0xFFF9F4F2), width: 2),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Color(0xFFCFCBC9),
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              onTap: navManager.onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: ColorFiltered(
                    colorFilter: selectedIndex == 0
                        ? ColorFilter.mode(Color(0xFFFEAC33), BlendMode.srcIn)
                        : ColorFilter.mode(Color(0xFFCFCBC9), BlendMode.srcIn),
                    child: Image.asset(
                      'assets/images/bottom_nav/home.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  label: "Эхлэл",
                ),
                BottomNavigationBarItem(
                  icon: ColorFiltered(
                    colorFilter: selectedIndex == 1
                        ? ColorFilter.mode(Color(0xFFFEAC33), BlendMode.srcIn)
                        : ColorFilter.mode(Color(0xFFCFCBC9), BlendMode.srcIn),
                    child: Image.asset(
                      'assets/images/bottom_nav/news.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  label: 'Мэдээ',
                ),
                BottomNavigationBarItem(
                  icon: ColorFiltered(
                    colorFilter: selectedIndex == 2
                        ? ColorFilter.mode(Color(0xFFFEAC33), BlendMode.srcIn)
                        : ColorFilter.mode(Color(0xFFCFCBC9), BlendMode.srcIn),
                    child: Image.asset(
                      'assets/images/bottom_nav/downloads.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  label: "Татсан",
                ),
                BottomNavigationBarItem(
                  icon: ColorFiltered(
                    colorFilter: selectedIndex == 3
                        ? ColorFilter.mode(Color(0xFFFEAC33), BlendMode.srcIn)
                        : ColorFilter.mode(Color(0xFFCFCBC9), BlendMode.srcIn),
                    child: Image.asset(
                      'assets/images/bottom_nav/profile.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  label: "Профайл",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
