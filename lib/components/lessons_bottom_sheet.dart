import 'package:audio_app_2/page_manager.dart';
import 'package:flutter/material.dart';

class LessonsBottomSheet extends StatelessWidget {
  const LessonsBottomSheet({super.key, required this.pageManager});

  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageManager.playlistNotifier,
      builder: (context, lessons, _) {
        return SizedBox(
          width: 160,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.5,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 20,
                            right: 20,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Container(
                                width: 40,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(height: 19),
                              Row(
                                children: [
                                  Text(
                                    'Хичээл',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 27 / 16,
                                      color: Color(0xFF33547D),
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    '(${lessons.length})',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 27 / 16,
                                      color: Color(0xFFA9B0BB),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: lessons.length,
                                  itemBuilder: (context, index) {
                                    final lesson = lessons[index];
                                    final isSelected =
                                        pageManager
                                            .currentLessonNotifier
                                            .value ==
                                        lesson;
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: isSelected
                                              ? Color(0xFFF5B945)
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          'assets/images/audio.png',
                                          width: 34,
                                          height: 34,
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
                                        subtitle: Text(lesson.lessonNumber),
                                        onTap: () {
                                          pageManager.playLessonAt(index);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            icon: const Icon(Icons.close, size: 16),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF4F6F8),
              foregroundColor: Color(0xFF33547D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Хичээл'),
                const SizedBox(width: 3),
                Text(
                  '(${lessons.length})',
                  style: TextStyle(color: Color(0xFFA9B0BB)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
