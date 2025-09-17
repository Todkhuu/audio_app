import 'package:flutter/material.dart';
import 'package:audio_app_2/models/audio_lesson.dart';

class LessonInfo extends StatelessWidget {
  final AudioLesson lesson;

  const LessonInfo({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    String formatDuration(Duration duration) {
      return "${duration.inMinutes} мин";
    }

    return Padding(
      padding: const EdgeInsets.only(top: 45, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lesson.lessonName,
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
      ),
    );
  }
}
