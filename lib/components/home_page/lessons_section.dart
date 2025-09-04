// widgets/lessons_section.dart
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'lesson_card.dart';

class LessonsSection extends StatelessWidget {
  final PageManager pageManager;

  const LessonsSection({super.key, required this.pageManager});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset('assets/images/jargaa.png'),
              const SizedBox(height: 30),
              Row(
                children: [
                  Image.asset(
                    'assets/images/polygon.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 11),
                  const Text(
                    'Үндсэн сургалтууд',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      height: 27 / 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ValueListenableBuilder(
                valueListenable: pageManager.assetsLessonsNotifier,
                builder: (context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: pageManager.assetsLessonsNotifier.value.length,
                    itemBuilder: (context, index) {
                      final lesson =
                          pageManager.assetsLessonsNotifier.value[index];
                      return LessonCard(
                        lesson: lesson,
                        pageManager: pageManager,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
