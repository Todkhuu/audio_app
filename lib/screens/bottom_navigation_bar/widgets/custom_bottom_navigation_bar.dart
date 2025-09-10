import 'package:audio_app_2/screens/bottom_navigation_bar/widgets/build_nav_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    int displayIndex = selectedIndex;
    if (selectedIndex > 3) {
      displayIndex = selectedIndex - 1;
    }

    return Container(
      height: 89,
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
            currentIndex: selectedIndex > 3 ? selectedIndex - 1 : selectedIndex,
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
            onTap: onItemTapped,
            items: [
              buildNavItem(
                'assets/images/bottom_nav/home.png',
                displayIndex == 0,
                "Эхлэл",
              ),
              buildNavItem(
                'assets/images/bottom_nav/lesson.png',
                displayIndex == 1,
                "Хичээл",
              ),
              buildNavItem(
                'assets/images/bottom_nav/news.png',
                displayIndex == 2,
                "Мэдээ",
              ),
              buildNavItem(
                'assets/images/bottom_nav/profile.png',
                false,
                "Миний",
              ),
              buildNavItem(
                'assets/images/bottom_nav/downloads.png',
                displayIndex == 3,
                "Татсан",
              ),
            ],
          ),
          // Indicator
          if (selectedIndex != 3)
            Positioned(
              top: 0,
              left:
                  MediaQuery.of(context).size.width / 5 * displayIndex +
                  (MediaQuery.of(context).size.width / 5 - 24) / 2,
              child: Container(
                width: 24,
                height: 2.05,
                color: const Color(0xFF33547D),
              ),
            ),
        ],
      ),
    );
  }
}
