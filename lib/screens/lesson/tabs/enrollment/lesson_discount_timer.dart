import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class LessonDiscountTimer extends StatelessWidget {
  const LessonDiscountTimer({
    super.key,
    required this.lesson,
    required this.pageManager,
  });

  final AudioLesson lesson;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    if (lesson.category == 'Үнэгүй сургалт') return const SizedBox.shrink();

    final countdownNotifier = pageManager.getCountdownNotifier(
      lesson.lessonNumber,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        StyledThinGreyText('Хөнгөлөлт дуусах хугацаа'),
        if (countdownNotifier != null)
          ValueListenableBuilder<Duration>(
            valueListenable: countdownNotifier,
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
    );
  }
}
