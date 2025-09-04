import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageManager.currentLessonNotifier,
      builder: (context, lesson, _) {
        final isLiked = lesson?.isLiked ?? true;
        return Container(
          width: 88,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {
              if (lesson != null) {
                pageManager.currentLessonNotifier.value = AudioLesson(
                  title: lesson.title,
                  lessonName: lesson.lessonName,
                  lessonNumber: lesson.lessonNumber,
                  startTime: lesson.startTime,
                  duration: lesson.duration,
                  audioPath: lesson.audioPath,
                  lessonDescription: lesson.lessonDescription,
                  isLiked: !lesson.isLiked,
                  image: lesson.image,
                  bgImage: lesson.bgImage,
                  remainingDays: lesson.remainingDays,
                  price: lesson.price,
                );
              }
            },
            icon: Image.asset(
              'assets/images/action_control/like.png',
              width: 26,
              height: 26,
              color: isLiked ? Colors.red : Color(0xFFCAD0D7),
            ),
          ),
        );
      },
    );
  }
}
