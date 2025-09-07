import 'package:audio_app_2/components/home_page/custom_app_bar.dart';
import 'package:audio_app_2/managers/bottom_nav_manager.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/pages/downloaded_lessons_page.dart';
import 'package:audio_app_2/pages/home_page.dart';
import 'package:audio_app_2/pages/lesson_page.dart';
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
      LessonPage(),
      NewsPage(),
      ProfilePage(),
      DownloadedLessonsPage(pageManager: pageManager),
    ];

    return ValueListenableBuilder(
      valueListenable: navManager.selectedIndex,
      builder: (context, selectedIndex, _) {
        return Scaffold(
          appBar: const CustomAppBar(),
          body: pages[selectedIndex],
          bottomNavigationBar: Container(
            height: 89,
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                BottomNavigationBar(
                  currentIndex: selectedIndex,
                  selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Color(0xFF33547D),
                    height: 25 / 14,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0xFFCAD0D7),
                    height: 25 / 14,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: true,
                  onTap: navManager.onItemTapped,
                  items: [
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: selectedIndex == 0
                            ? ColorFilter.mode(
                                Color(0xFF33547D),
                                BlendMode.srcIn,
                              )
                            : ColorFilter.mode(
                                Color(0xFFCAD0D7),
                                BlendMode.srcIn,
                              ),
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
                            ? ColorFilter.mode(
                                Color(0xFF33547D),
                                BlendMode.srcIn,
                              )
                            : ColorFilter.mode(
                                Color(0xFFCAD0D7),
                                BlendMode.srcIn,
                              ),
                        child: Image.asset(
                          'assets/images/bottom_nav/lesson.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      label: 'Хичээл',
                    ),
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: selectedIndex == 2
                            ? ColorFilter.mode(
                                Color(0xFF33547D),
                                BlendMode.srcIn,
                              )
                            : ColorFilter.mode(
                                Color(0xFFCAD0D7),
                                BlendMode.srcIn,
                              ),
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
                        colorFilter: selectedIndex == 3
                            ? ColorFilter.mode(
                                Color(0xFF33547D),
                                BlendMode.srcIn,
                              )
                            : ColorFilter.mode(
                                Color(0xFFCAD0D7),
                                BlendMode.srcIn,
                              ),
                        child: Image.asset(
                          'assets/images/bottom_nav/profile.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      label: "Миний",
                    ),
                    BottomNavigationBarItem(
                      icon: ColorFiltered(
                        colorFilter: selectedIndex == 4
                            ? ColorFilter.mode(
                                Color(0xFF33547D),
                                BlendMode.srcIn,
                              )
                            : ColorFilter.mode(
                                Color(0xFFCAD0D7),
                                BlendMode.srcIn,
                              ),
                        child: Image.asset(
                          'assets/images/bottom_nav/downloads.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      label: "Татсан",
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  left:
                      MediaQuery.of(context).size.width / 5 * selectedIndex +
                      (MediaQuery.of(context).size.width / 5 - 24) / 2,
                  child: Container(
                    width: 24,
                    height: 2.05,
                    color: Color(0xFF33547D),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
