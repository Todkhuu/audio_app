import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';

class LessonDiscountTimer extends StatelessWidget {
  const LessonDiscountTimer({
    super.key,
    required this.lessonNumber,
    required this.pageManager,
  });

  final String lessonNumber;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    final notifier = pageManager.getCountdownNotifier(lessonNumber.toString());
    if (notifier == null) return const SizedBox();

    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 40,
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
          ValueListenableBuilder<Duration>(
            valueListenable: notifier,
            builder: (context, remaining, child) {
              final text = remaining.inSeconds > 0
                  ? PageManager.formatDuration(remaining)
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
