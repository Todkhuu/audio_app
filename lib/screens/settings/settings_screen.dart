import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/profile/profile_widget.dart';
import 'package:audio_app_2/screens/notification_settings/notification_settings_screen.dart';
import 'package:audio_app_2/screens/settings/widgets/delete_register_button.dart';
import 'package:audio_app_2/screens/settings/widgets/language_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensHeader(text: 'Тохиргоо'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 15),
            LanguageButton(title: 'Хэл солих', onPressed: () {}),
            const SizedBox(height: 15),
            ProfileWidget(
              title: 'Мэдэгдэл тохиргоо',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationSettingsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            ProfileWidget(title: 'Үйлчилгээний нөхцөл', onPressed: () {}),
            const SizedBox(height: 15),
            ProfileWidget(title: 'Нууцлалын бодлого', onPressed: () {}),
            const SizedBox(height: 40),
            ProfileWidget(title: 'Түгээмэл асуултууд', onPressed: () {}),
            const SizedBox(height: 15),
            ProfileWidget(title: 'Бидний тухай', onPressed: () {}),
            const SizedBox(height: 15),
            ProfileWidget(title: 'Холбоо барих', onPressed: () {}),
            const SizedBox(height: 15),
            DeleteRegisterButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
