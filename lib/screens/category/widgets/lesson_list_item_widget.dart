import 'package:flutter/material.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'lesson_image.dart';
import 'lesson_info.dart';
import 'lesson_discount_timer.dart';

class LessonListItemWidget extends StatelessWidget {
  const LessonListItemWidget({
    super.key,
    required this.lesson,
    required this.pageManager,
    required this.onTap,
  });

  final AudioLesson lesson;
  final PageManager pageManager;
  final VoidCallback onTap;

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
          onTap: onTap,
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
                if (lesson.category != "Үнэгүй сургалт")
                  LessonDiscountTimer(
                    lessonNumber: lesson.lessonNumber,
                    pageManager: pageManager,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
