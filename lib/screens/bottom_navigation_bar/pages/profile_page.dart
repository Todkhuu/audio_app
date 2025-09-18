import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/managers/auth_manager.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/screens/auth/login_screen.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/profile/profile_widget.dart';
import 'package:audio_app_2/screens/e_barimt/e_barimt_screen.dart';
import 'package:audio_app_2/screens/my_profile/my_profile_screen.dart';
import 'package:audio_app_2/screens/settings/settings_screen.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageManager pageManager = PageManager();
    final authManager = context.watch<AuthManager>();
    final user = authManager.user;

    if (user == null) {
      return const Center(child: Text('Хэрэглэгчийн мэдээлэл алга байна'));
    }
    return Scaffold(
      appBar: ScreensHeader(text: 'Миний'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 119,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.only(top: 48),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StyledBodyText(user.name ?? 'Нэргүй'),
                      Text(
                        user.phones ?? '+976-XXXX-XXXX',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFA9B0BB),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -48,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/profile/profile.png',
                      width: 95,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ProfileWidget(
              title: 'Миний бүртгэл',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProfileScreen(user: user),
                  ),
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
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                final authManager = context.read<AuthManager>();
                authManager.logout();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.7,
                    vertical: 13.7,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/profile/logout.png',
                        width: 18.5,
                      ),
                      const SizedBox(width: 10.7),
                      StyledBodyText('Гарах'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
