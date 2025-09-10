import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/lesson/widgets/lesson_banner_image.dart';
import 'package:audio_app_2/screens/lesson/widgets/lesson_tabs.dart';
import 'package:flutter/material.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({
    super.key,
    required this.pageManager,
    required this.lesson,
  });

  final PageManager pageManager;
  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f5f7),
      appBar: ScreensHeader(text: lesson.title),
      body: Column(
        children: [
          LessonBannerImage(lesson: lesson),
          LessonTabs(lesson: lesson, pageManager: pageManager),
        ],
      ),
    );
  }
}
