import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/page_manager.dart';
import 'package:flutter/material.dart';

class LessonInfo extends StatelessWidget {
  final PageManager pageManager;

  const LessonInfo({super.key, required this.pageManager});

  @override
  Widget build(BuildContext context) {
    String formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final hours = twoDigits(duration.inHours.remainder(12));
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));
      return "$hours:$minutes:$seconds";
    }

    return Padding(
      padding: const EdgeInsets.only(top: 45, bottom: 30),
      child: ValueListenableBuilder<AudioLesson?>(
        valueListenable: pageManager.currentLessonNotifier,
        builder: (_, lesson, __) {
          if (lesson == null) return SizedBox.shrink();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF33547D),
                  height: 25 / 16,
                ),
              ),
              Text(
                "${lesson.lessonNumber} • ${lesson.startTime} • ${formatDuration(lesson.duration)}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA9B0BB),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
