import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:flutter/material.dart';

class LessonBannerImage extends StatelessWidget {
  const LessonBannerImage({super.key, required this.lesson});

  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              lesson.bgImage,
              height: 195,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 35,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4.5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/bg/star.png', width: 12),
                const SizedBox(width: 2),
                Text(
                  lesson.rate.toString(),
                  style: const TextStyle(
                    color: Color(0xFFF5B945),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
