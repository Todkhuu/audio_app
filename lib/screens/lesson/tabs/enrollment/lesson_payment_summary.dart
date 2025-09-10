import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/common/dashed_divider.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class LessonPaymentSummary extends StatelessWidget {
  const LessonPaymentSummary({super.key, required this.lesson});

  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFf2f5f7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Хичээл',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF33547D),
                  ),
                ),
                StyledSmallBodyText(lesson.title),
              ],
            ),
          ),
          DashedDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Төлөх дүн',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF33547D),
                  ),
                ),
                StyledSmallBodyText(lesson.price.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
