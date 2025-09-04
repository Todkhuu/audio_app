import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/screens/player_screen.dart';
import 'package:flutter/material.dart';

class DownloadedLessonsPage extends StatelessWidget {
  final PageManager pageManager;
  const DownloadedLessonsPage({super.key, required this.pageManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Татагдсан файлууд")),
      body: ValueListenableBuilder<List<AudioLesson>>(
        valueListenable: pageManager.downloadedLessonsNotifier,
        builder: (context, downloadedLessons, _) {
          if (downloadedLessons.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.download_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "Татсан файл алга байна",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Home хуудаснаас файл татаж авна уу",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: downloadedLessons.length,
            itemBuilder: (context, index) {
              final lesson = downloadedLessons[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.download_done, color: Colors.white),
                  ),
                  title: Text(lesson.title),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(lesson.lessonNumber),
                      Text(
                        lesson.lessonDescription,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Play товч
                      IconButton(
                        icon: Image.asset(
                          'assets/images/audio_control/play.png',
                        ),
                        onPressed: () {
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
                      ),
                      // Delete товч
                      TextButton(
                        onPressed: () async {
                          await pageManager.deleteDownloadedLesson(lesson);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${lesson.title} устгагдлаа'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text(
                          'Устгах',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// <--- Delete Dialog --->
// void _showDeleteConfirmation(BuildContext context, AudioLesson lesson) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Файл устгах'),
//           content: Text('${lesson.title} файлыг устгахдаа итгэлтэй байна уу?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Цуцлах'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 await pageManager.deleteDownloadedLesson(lesson);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('${lesson.title} устгагдлаа'),
//                     duration: const Duration(seconds: 2),
//                   ),
//                 );
//               },
//               child: const Text('Устгах', style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         );
//       },
//     );
//   }
