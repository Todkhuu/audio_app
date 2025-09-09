import 'package:audio_app_2/screens/category/widgets/lesson_list_item_widget.dart';
import 'package:audio_app_2/screens/category/widgets/lessons_empty_state_widget.dart';
import 'package:audio_app_2/managers/categories_controller.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/screens/lesson_meet/lesson_meet_screen.dart';
import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> with TickerProviderStateMixin {
  late PageManager pageManager;
  late CategoriesController controller;

  @override
  void initState() {
    super.initState();
    pageManager = PageManager();
    controller = CategoriesController(pageManager: pageManager);
  }

  @override
  void dispose() {
    controller.dispose();
    pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final lessons = controller.filteredLessons;

        if (lessons.isEmpty) {
          return LessonsEmptyStateWidget(
            categoryName: controller.selectedCategory,
          );
        }

        return Scaffold(
          body: ListView.builder(
            padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return LessonListItemWidget(
                lesson: lesson,
                pageManager: pageManager,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonMeetScreen(
                        pageManager: pageManager,
                        lesson: lesson,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
