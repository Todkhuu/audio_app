// widgets/lesson_card.dart
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/screens/player_screen.dart';

class LessonCard extends StatelessWidget {
  final dynamic lesson; // lesson model type-ийг тодорхой болгох хэрэгтэй
  final PageManager pageManager;

  const LessonCard({
    super.key,
    required this.lesson,
    required this.pageManager,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            pageManager.playAssetLesson(lesson);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    PlayerScreen(lesson: lesson, pageManager: pageManager),
              ),
            );
          },
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Color(0xFFF9F4F2), width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            height: 20 / 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/circleclock.png',
                              width: 16,
                            ),
                            const SizedBox(width: 7),
                            Text(
                              '${lesson.remainingDays} хоног',
                              style: const TextStyle(color: Color(0xFFADAAA8)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Image.asset('assets/images/wallet.png', width: 16),
                            const SizedBox(width: 7),
                            Text('${lesson.price} ₮'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset(lesson.image, width: 125, height: 99),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
