import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/screens/e_barimt/e_barimt_detail_screen.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/ebarimt.dart';
import 'package:intl/intl.dart';

class EBarimtScreen extends StatelessWidget {
  final PageManager pageManager;

  const EBarimtScreen({super.key, required this.pageManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensHeader(text: 'И-Баримт'),
      body: ValueListenableBuilder<List<EBarimt>>(
        valueListenable: eBarimtsNotifier,
        builder: (context, eBarimts, _) {
          // lessonId-д eBarimt байгаа эсэхийг шалгах
          final lessonIdsWithEBarimt = eBarimts.map((e) => e.lessonId).toSet();
          final allLessons =
              (pageManager.assetsLessonsNotifier.value +
                      pageManager.downloadedLessonsNotifier.value)
                  .where((lesson) => lessonIdsWithEBarimt.contains(lesson.id))
                  .toList();

          if (allLessons.isEmpty) {
            return const Center(child: Text("E-Barimt-тэй lesson олдсонгүй"));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemCount: allLessons.length,
            itemBuilder: (context, index) {
              final lesson = allLessons[index];

              // lessonId-р e-barimt filter хийх
              final lessonEBarimts = eBarimts
                  .where((e) => e.lessonId == lesson.id)
                  .toList();

              return Card(
                elevation: 0,
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Lesson title
                      StyledBodyText(lesson.title),
                      // EBarimt preview
                      ...lessonEBarimts.map((ebarimt) {
                        if (ebarimt.type == EBarimtType.individual) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat(
                                  'yyyy-MM-dd HH:mm',
                                ).format(ebarimt.paidDate!),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFA9B0BB),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat(
                                  'yyyy-MM-dd HH:mm',
                                ).format(ebarimt.paidDate!),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFA9B0BB),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        }
                      }),

                      Divider(color: Color(0xFFF4F6F8), thickness: 2),
                      const SizedBox(height: 10),

                      // Lesson price & button
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StyledBodyText('${lesson.price}₮'),
                              const Text(
                                'Төлсөн дүн',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFA9B0BB),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EBarimtDetailScreen(
                                    lessonEBarimts: lessonEBarimts,
                                    lesson: lesson,
                                  ),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              backgroundColor: const Color(0xFF33547D),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('И-Баримт'),
                          ),
                        ],
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
