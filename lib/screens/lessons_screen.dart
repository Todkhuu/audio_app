// screens/lessons_screen.dart
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';

class LessonsScreen extends StatefulWidget {
  final PageManager pageManager;
  const LessonsScreen({super.key, required this.pageManager});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    final categories = widget.pageManager.getLessonsByCategory();
    if (categories.isNotEmpty) {
      selectedCategory = categories.keys.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = widget.pageManager.getLessonsByCategory();

    final lessons = selectedCategory != null
        ? categories[selectedCategory!]!
        : <AudioLesson>[];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Сургалтууд'),
        backgroundColor: const Color(0xFF33547D),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories horizontal row
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: categories.keys.map((categoryName) {
                final isSelected = categoryName == selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categoryName;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF33547D)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        categoryName,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 10),

          // Lessons vertical column
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: lessons.map((lesson) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: lesson.price == 0
                          ? const Icon(
                              Icons.free_cancellation,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.play_circle_fill,
                              color: Color(0xFF33547D),
                            ),
                      title: Text(lesson.title),
                      subtitle: Text(
                        "${lesson.lessonName} • Үргэлжлэх хугацаа: ${lesson.duration.inMinutes} мин",
                      ),
                      trailing: lesson.price > 0
                          ? Text(
                              "${lesson.price}₮",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : null,
                      onTap: () {
                        widget.pageManager.playAssetLesson(lesson);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
