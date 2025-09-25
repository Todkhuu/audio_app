import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/category/widgets/lesson_image.dart';
import 'package:audio_app_2/screens/category/widgets/lesson_info.dart';
import 'package:flutter/material.dart';

class RecommendedLessonCard extends StatelessWidget {
  final AudioLesson lesson;
  const RecommendedLessonCard({required this.lesson, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    LessonImage(image: lesson.image, rate: lesson.rate ?? 0.0),
                    const SizedBox(width: 15.3),
                    Expanded(
                      child: LessonInfo(
                        title: lesson.title,
                        mentor: 'Менторгүй',
                        remainingDays: lesson.remainingDays,
                        price: lesson.price,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
