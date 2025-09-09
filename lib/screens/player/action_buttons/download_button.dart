import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  final PageManager pageManager;
  final AudioLesson lesson;
  const DownloadButton({
    super.key,
    required this.pageManager,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<AudioLesson>>(
      valueListenable: pageManager.downloadedLessonsNotifier,
      builder: (context, downloadedLessons, _) {
        final isDownloaded = pageManager.isLessonDownloaded(lesson);

        return Container(
          width: 88,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: isDownloaded
                ? null
                : () async {
                    await pageManager.downloadAndPlay(lesson);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Аудио татагдаж хадгалагдлаа ✅"),
                      ),
                    );
                  },
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isDownloaded ? Color(0xFF33547D) : Color(0xFFCAD0D7),
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/action_control/download.png',
                width: 26,
                height: 26,
              ),
            ),
          ),
        );
      },
    );
  }
}
