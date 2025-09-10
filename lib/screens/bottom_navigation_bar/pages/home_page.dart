// pages/home_page.dart
import 'package:audio_app_2/screens/bottom_navigation_bar/home/banner_widget.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/home/category_section_widget.dart';
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
            const BannerWidget(),
            ValueListenableBuilder<List<AudioLesson>>(
              valueListenable: pageManager.assetsLessonsNotifier,
              builder: (context, _, __) {
                final categories = pageManager.getLessonsByCategory();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: categories.entries.map((entry) {
                    final categoryName = entry.key;
                    final lessons = entry.value;

                    return CategorySectionWidget(
                      categoryName: categoryName,
                      lessons: lessons,
                      pageManager: pageManager,
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
