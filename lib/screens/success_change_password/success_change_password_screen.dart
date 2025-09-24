import 'package:audio_app_2/screens/bottom_navigation_bar/audio_app_bottom_nav.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class SuccessChangePasswordScreen extends StatelessWidget {
  const SuccessChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset('assets/images/auth/bg.png'),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 45, right: 32),
                child: Column(
                  children: [
                    Text(
                      'Та одоо бүртгэл рүүгээ аюулгүйгээр нэвтэрч, үйлчилгээгээ үзүүлэх эрхтэй боллоо',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF33547D),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    StyledBodyText('Шинэ нууц үг идэвхжлээ'),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 35,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (AudioAppBottomNav()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(180, 50),
                backgroundColor: Color(0xFF33547D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Нүүр хуудас',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
