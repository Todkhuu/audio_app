import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/recommended_course/widgets/recommended_bottom_actions.dart';
import 'package:audio_app_2/screens/recommended_course/widgets/recommended_heade.dart';
import 'package:audio_app_2/screens/recommended_course/widgets/recommended_lesson_card.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:audio_app_2/utils/mock_audio_lessons.dart';
import 'package:flutter/material.dart';

class RecommendedCourseScreen extends StatelessWidget {
  const RecommendedCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioLesson lesson = mockAudioLessons[0];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecommendedHeader(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledBodyText('Танд санал болгох хичээл'),
                const SizedBox(height: 20),
                RecommendedLessonCard(lesson: lesson),
              ],
            ),
          ),
          Spacer(),
          RecommendedBottomActions(),
        ],
      ),
    );
  }
}
