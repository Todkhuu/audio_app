// widgets/lesson_card_widget.dart
import 'package:audio_app_2/components/home_page/discount_timer_widget.dart';
import 'package:audio_app_2/components/home_page/lesson_image_widget.dart';
import 'package:audio_app_2/components/home_page/lesson_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';

class LessonCardWidget extends StatelessWidget {
  const LessonCardWidget({
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
      width: 270,
      margin: const EdgeInsets.only(right: 15),
      child: Card(
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
                // Main content row (Image + Info)
                Row(
                  children: [
                    LessonImageWidget(imageUrl: lesson.image),
                    const SizedBox(width: 10),
                    Expanded(
                      child: LessonInfoWidget(
                        title: lesson.title,
                        remainingDays: lesson.remainingDays,
                        price: lesson.price,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Discount timer (only for paid lessons)
                if (lesson.category != "Үнэгүй сургалт")
                  DiscountTimerWidget(lesson: lesson, pageManager: pageManager),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
