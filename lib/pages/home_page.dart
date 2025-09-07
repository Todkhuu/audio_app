// pages/home_page.dart
import 'package:audio_app_2/screens/lessons_screen.dart';
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Image.asset('assets/images/Banner.png'),
            ),

            // Categories + Lessons
            ValueListenableBuilder<List<AudioLesson>>(
              valueListenable: pageManager.assetsLessonsNotifier,
              builder: (context, _, __) {
                final categories = pageManager.getLessonsByCategory();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: categories.entries.map((entry) {
                    final categoryName = entry.key;
                    final lessons = entry.value;

                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    categoryName,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF33547D),
                                      height: 27 / 14,
                                    ),
                                  ),
                                  Text(
                                    ' (${lessons.length})',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFA9B0BB),
                                      height: 27 / 14,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LessonsScreen(
                                        pageManager: pageManager,
                                      ),
                                    ),
                                  );
                                },
                                icon: Image.asset(
                                  'assets/images/rightarrow.png',
                                  width: 12,
                                ),
                              ),
                            ],
                          ),
                          // Lessons horizontal scroll
                          SizedBox(
                            height:
                                lessons.any(
                                  (lesson) =>
                                      lesson.category != "Үнэгүй сургалт",
                                )
                                ? 165
                                : 138,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: lessons.length,
                              itemBuilder: (context, index) {
                                final lesson = lessons[index];
                                return Container(
                                  width: 270,
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Colors.white,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LessonsScreen(
                                              pageManager: pageManager,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Image
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.asset(
                                                    lesson.image,
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                // Title
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        lesson.title,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12,
                                                          height: 15 / 14,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 21,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.person,
                                                            size: 12,
                                                            color: Color(
                                                              0xFFCAD0D7,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "Менторгүй",
                                                            style:
                                                                const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                    0xFFA9B0BB,
                                                                  ),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .calendar_month_sharp,
                                                            size: 11.57,
                                                            color: Color(
                                                              0xFFCAD0D7,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            '${lesson.remainingDays} хоног',
                                                            style:
                                                                const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                    0xFFA9B0BB,
                                                                  ),
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                      if (lesson.price > 0)
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .discount_rounded,
                                                              size: 11.57,
                                                              color: Color(
                                                                0xFFCAD0D7,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "${lesson.price}₮",
                                                              style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                  0xFFE8553E,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      else
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .discount_rounded,
                                                              size: 11.57,
                                                              color: Color(
                                                                0xFFCAD0D7,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'Үнэгүй',
                                                              style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                  0xFFA9B0BB,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            if (lesson.category !=
                                                "Үнэгүй сургалт")
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                width: 250,
                                                height: 27,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xFFF4F6F8),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Эдгэрлийн хөнгөлөлт',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10,
                                                        height: 12 / 14,
                                                        color: Color(
                                                          0xFFA9B0BB,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 6,
                                                    ), // Сайн харагдуулах зай
                                                    if (pageManager
                                                            .getCountdownNotifier(
                                                              lesson
                                                                  .lessonNumber,
                                                            ) !=
                                                        null)
                                                      ValueListenableBuilder<
                                                        Duration
                                                      >(
                                                        valueListenable: pageManager
                                                            .getCountdownNotifier(
                                                              lesson
                                                                  .lessonNumber,
                                                            )!,
                                                        builder: (context, remaining, child) {
                                                          final text =
                                                              remaining
                                                                      .inSeconds >
                                                                  0
                                                              ? PageManager.formatDurationDaysHours(
                                                                  remaining,
                                                                )
                                                              : 'Дууссан';
                                                          return Text(
                                                            text,
                                                            style:
                                                                const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 10,
                                                                  color: Color(
                                                                    0xFFE8553E,
                                                                  ),
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
