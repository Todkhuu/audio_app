import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:flutter/material.dart';

class LessonMeetScreen extends StatelessWidget {
  const LessonMeetScreen({
    super.key,
    required this.pageManager,
    required this.lesson,
  });
  final PageManager pageManager;
  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('')));
  }
}
