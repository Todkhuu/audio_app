// widgets/lesson_list_item_widget.dart
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';

class LessonListItemWidget extends StatelessWidget {
  const LessonListItemWidget({
    super.key,
    required this.lesson,
    required this.pageManager,
    required this.onTap,
  });

  final AudioLesson lesson;
  final PageManager pageManager;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main content row (Image + Info)
                Row(
                  children: [
                    Stack(
                      children: [
                        // Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            lesson.image,
                            width: 118.7,
                            height: 118.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white, // эсвэл хүссэн color
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/bg/star.png',
                                  width: 10,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  lesson.rate.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFFF5B945),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 15.3),
                    Expanded(
                      child: SizedBox(
                        height: 116,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Title
                            Text(
                              lesson.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 17 / 14,
                                color: Color(0xFF33547D),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),

                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: 12,
                                      color: Color(0xFFCAD0D7),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Менторгүй",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFA9B0BB),
                                      ),
                                    ),
                                  ],
                                ),
                                // Duration
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month_sharp,
                                      size: 11.57,
                                      color: Color(0xFFCAD0D7),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${lesson.remainingDays} хоног',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFA9B0BB),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                // Price
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.discount_rounded,
                                      size: 11.57,
                                      color: Color(0xFFCAD0D7),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      lesson.price > 0
                                          ? "${lesson.price.toInt()}₮"
                                          : 'Үнэгүй',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: lesson.price > 0
                                            ? const Color(0xFFE8553E)
                                            : const Color(0xFFA9B0BB),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Discount timer (only for paid lessons)
                if (lesson.category != "Үнэгүй сургалт")
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF4F6F8),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Эдгэрлийн хөнгөлөлт',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            height: 12 / 14,
                            color: Color(0xFFA9B0BB),
                          ),
                        ),
                        const SizedBox(width: 6),
                        if (pageManager.getCountdownNotifier(
                              lesson.lessonNumber,
                            ) !=
                            null)
                          ValueListenableBuilder<Duration>(
                            valueListenable: pageManager.getCountdownNotifier(
                              lesson.lessonNumber,
                            )!,
                            builder: (context, remaining, child) {
                              final text = remaining.inSeconds > 0
                                  ? PageManager.formatDuration(remaining)
                                  : 'Дууссан';
                              return Text(
                                text,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Color(0xFFE8553E),
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
  }
}
