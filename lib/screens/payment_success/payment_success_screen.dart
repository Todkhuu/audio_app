import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/lesson/lessons_screen.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final AudioLesson lesson;
  const PaymentSuccessScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final PageManager pageManager = PageManager();
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/payment/meditation.png'),
          const SizedBox(height: 45),
          SizedBox(
            width: 295,
            child: Text(
              'Өөрийн бие сэтгэлээ эдгээгээд зогсохгүй өнгөлөг жаргалтай амьдрах замыг сонгосонд талархъя',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF33547D)),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Таны эдгэрэл эндээс эхэлж байна',
            style: TextStyle(
              color: Color(0xFF33547D),
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 35),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonsScreen(
                        pageManager: pageManager,
                        lesson: lesson,
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF33547D),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),

                child: Text(
                  'Хичээл үзэх',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
