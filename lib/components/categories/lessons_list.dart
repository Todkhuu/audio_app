import 'package:audio_app_2/components/categories/lesson_list_item_widget.dart';
import 'package:audio_app_2/components/categories/lessons_empty_state_widget.dart';
import 'package:audio_app_2/managers/categories_controller.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class LessonsList extends StatelessWidget {
  const LessonsList({
    super.key,
    required this.controller,
    required this.pageManager,
  });
  final CategoriesController controller;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    final lessons = controller.filteredLessons;

    if (lessons.isEmpty) {
      return LessonsEmptyStateWidget(categoryName: controller.selectedCategory);
    }
    return ListView.builder(
      padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return LessonListItemWidget(
          lesson: lesson,
          pageManager: pageManager,
          onTap: () => (),
        );
      },
    );
  }
}
