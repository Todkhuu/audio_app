import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/player_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ValueListenableBuilder<List<AudioLesson>>(
        valueListenable: pageManager.assetsLessonsNotifier,
        builder: (context, lessons, _) {
          return ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return ListTile(
                title: Text(lesson.title),
                subtitle: Text(lesson.lessonNumber),
                trailing: IconButton(
                  onPressed: () {
                    pageManager.playAssetLesson(lesson);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerScreen(
                          lesson: lesson,
                          pageManager: pageManager,
                        ),
                      ),
                    );
                  },
                  icon: Image.asset('assets/images/play.png'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
