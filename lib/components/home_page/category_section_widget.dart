// widgets/category_section_widget.dart - Updated
import 'package:audio_app_2/components/home_page/category_header_widget.dart';
import 'package:audio_app_2/components/home_page/lesson_card_widget.dart';
import 'package:audio_app_2/screens/lessons_screen.dart';
import 'package:audio_app_2/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';

class CategorySectionWidget extends StatelessWidget {
  const CategorySectionWidget({
    super.key,
    required this.categoryName,
    required this.lessons,
    required this.pageManager,
  });

  final String categoryName;
  final List<AudioLesson> lessons;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryHeaderWidget(
            categoryName: categoryName,
            lessonCount: lessons.length,
            onSeeAllPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoriesScreen(pageManager: pageManager),
                ),
              );
            },
          ),
          // Lessons horizontal scroll
          SizedBox(
            height: lessons.any((lesson) => lesson.category != "Үнэгүй сургалт")
                ? 165
                : 138,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                return LessonCardWidget(
                  lesson: lesson,
                  pageManager: pageManager,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LessonsScreen(
                          pageManager: pageManager,
                          lesson: lesson,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
