// widgets/discount_timer_widget.dart
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';

class DiscountTimerWidget extends StatelessWidget {
  const DiscountTimerWidget({
    super.key,
    required this.lesson,
    required this.pageManager,
  });

  final AudioLesson lesson;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: 250,
      height: 27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF4F6F8),
      ),
      child: Row(
        children: [
          const Text(
            'Эдгэрлийн хөнгөлөлт',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10,
              height: 12 / 14,
              color: Color(0xFFA9B0BB),
            ),
          ),
          const SizedBox(width: 6),
          if (pageManager.getCountdownNotifier(lesson.lessonNumber) != null)
            ValueListenableBuilder<Duration>(
              valueListenable: pageManager.getCountdownNotifier(
                lesson.lessonNumber,
              )!,
              builder: (context, remaining, child) {
                final text = remaining.inSeconds > 0
                    ? PageManager.formatDurationDaysHours(remaining)
                    : 'Дууссан';
                return Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Color(0xFFE8553E),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
