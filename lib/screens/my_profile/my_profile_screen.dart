import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/models/user_model.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/profile/profile_widget.dart';
import 'package:audio_app_2/screens/change_password/change_password_screen.dart';
import 'package:audio_app_2/screens/fix_profile/fix_profile_screen.dart';
import 'package:audio_app_2/screens/my_profile/widgets/clear_profile_button.dart';
import 'package:audio_app_2/screens/my_profile/widgets/custom_text_field.dart';
import 'package:audio_app_2/screens/my_profile/widgets/phone_field.dart';
import 'package:audio_app_2/screens/my_profile/widgets/switch_tile.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key, required this.user});
  final User user;

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name ?? '');
    _emailController = TextEditingController(text: widget.user.email ?? '');
    _phoneController = TextEditingController(text: widget.user.phones ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensHeader(text: 'Миний бүртгэл'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
        child: Column(
          children: [
            CustomTextField(
              controller: _nameController,
              label: 'Хэрэглэгчийн нэр',
            ),
            const SizedBox(height: 16),
            CustomTextField(controller: _emailController, label: 'Цахим хаяг'),
            const SizedBox(height: 16),
            PhoneField(controller: _phoneController),
            const SizedBox(height: 16),
            SwitchTile(
              value: _isDarkMode,
              label: 'Идэвхтэй',
              onChanged: (val) => setState(() => _isDarkMode = val),
            ),

            const SizedBox(height: 40),

            ProfileWidget(
              title: 'Бүртгэл засах',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FixProfileScreen(user: widget.user),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            ProfileWidget(
              title: 'Нууц үг солих',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            ClearProfileButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
