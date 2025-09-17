import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class LessonsList extends StatelessWidget {
  const LessonsList({
    super.key,
    required this.lessons,
    required this.pageManager,
  });

  final List lessons;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    String formatDuration(Duration duration) {
      return "${duration.inMinutes} мин";
    }

    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        final isSelected = pageManager.currentLessonNotifier.value == lesson;

        return Card(
          color: const Color(0xFFF4F6F8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? const Color(0xFFF5B945) : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 16, right: 0),

            leading: ValueListenableBuilder<Set<String>>(
              valueListenable: pageManager.downloadingLessonsNotifier,
              builder: (context, downloadingLessons, _) {
                final isDownloading = downloadingLessons.contains(
                  lesson.lessonNumber,
                );
                final isDownloaded = pageManager.isLessonDownloaded(lesson);

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      'assets/images/audio.png',
                      width: 34,
                      height: 34,
                    ),

                    // Download icon болон progress
                    if (isDownloading || isDownloaded)
                      Positioned(
                        bottom: -5,
                        right: -8,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDownloading || isDownloaded
                                  ? const Color(0xFFF5B945)
                                  : Colors.white,
                              width: 2,
                            ),
                          ),
                          child: isDownloading
                              ? const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFFF5B945),
                                    ),
                                  ),
                                )
                              : Image.asset(
                                  'assets/images/action_control/download.png',
                                  width: 14,
                                  height: 14,
                                ),
                        ),
                      ),

                    // Favorite icon
                    if (lesson.isLiked == true)
                      const Positioned(
                        top: -6,
                        right: -6,
                        child: Icon(
                          Icons.favorite,
                          size: 14,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                );
              },
            ),

            title: Text(
              lesson.title,
              style: const TextStyle(
                color: Color(0xFF33547D),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 27 / 16,
              ),
            ),
            subtitle: Row(
              children: [
                StyledThinGreyText(
                  'Өдөр 3 • ${lesson.lessonNumber} • ${formatDuration(lesson.duration)}',
                ),
              ],
            ),
            trailing: SizedBox(
              width: 68,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/action_control/checkbox.png',
                    width: 20,
                  ),
                  PopupMenuButton<String>(
                    color: Colors.white,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onSelected: (value) async {
                      if (value == 'download') {
                        pageManager.downloadingLessonsNotifier.value = {
                          ...pageManager.downloadingLessonsNotifier.value,
                          lesson.lessonNumber,
                        };
                        await pageManager.downloadAndPlay(lesson);
                        final updated = Set<String>.from(
                          pageManager.downloadingLessonsNotifier.value,
                        );
                        updated.remove(lesson.lessonNumber);
                        pageManager.downloadingLessonsNotifier.value = updated;
                      } else if (value == 'delete') {
                        await pageManager.deleteDownloadedLesson(lesson);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'download',
                        child: Text('Татах'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Устгах'),
                      ),
                    ],
                    icon: const Icon(
                      Icons.more_vert,
                      size: 19,
                      color: Color(0xFF33547D),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              pageManager.playNetworkLesson(lesson);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
