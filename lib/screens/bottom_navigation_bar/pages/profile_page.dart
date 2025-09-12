import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/profile/profile_widget.dart';
import 'package:audio_app_2/screens/e_barimt/e_barimt_screen.dart';
import 'package:audio_app_2/screens/my_profile/my_profile_screen.dart';
import 'package:audio_app_2/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageManager pageManager = PageManager();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'assets/images/left.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 0),
                  const Text(
                    'Миний',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 18.54 / 16,
                      color: Color(0xFF33547D),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
        child: Column(
          children: [
            ProfileWidget(
              title: 'Миний бүртгэл',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfileScreen()),
                );
              },
            ),
            const SizedBox(height: 15),
            ProfileWidget(
              title: 'И-Баримт',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EBarimtScreen(pageManager: pageManager),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            ProfileWidget(
              title: 'Тохиргоо',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
