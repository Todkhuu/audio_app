import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/screens/player/widgets/lessons_bottom_sheet/lessons_sheet_content.dart';
import 'package:flutter/material.dart';

class LessonsBottomSheet extends StatelessWidget {
  const LessonsBottomSheet({super.key, required this.pageManager});

  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    final lessons = pageManager.filteredLessons;

    return SizedBox(
      width: 160,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) =>
                LessonsSheetContent(lessons: lessons, pageManager: pageManager),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFFf2f5f7),
          foregroundColor: const Color(0xFF33547D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Хичээл'),
            const SizedBox(width: 3),
            Text(
              '(${lessons.length})',
              style: const TextStyle(color: Color(0xFFA9B0BB)),
            ),
          ],
        ),
      ),
    );
  }
}
