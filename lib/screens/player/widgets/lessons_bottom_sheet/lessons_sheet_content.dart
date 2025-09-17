import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/screens/player/widgets/lessons_bottom_sheet/lessons_list.dart';
import 'package:audio_app_2/screens/player/widgets/lessons_bottom_sheet/sheet_close_button.dart';
import 'package:audio_app_2/screens/player/widgets/lessons_bottom_sheet/sheet_handle.dart';
import 'package:audio_app_2/screens/player/widgets/lessons_bottom_sheet/sheet_header.dart';
import 'package:flutter/material.dart';

class LessonsSheetContent extends StatelessWidget {
  const LessonsSheetContent({
    super.key,
    required this.lessons,
    required this.pageManager,
  });

  final List lessons;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                const SheetHandle(),
                const SizedBox(height: 19),
                SheetHeader(lessons: lessons, pageManager: pageManager),
                const SizedBox(height: 10),
                Expanded(
                  child: LessonsList(
                    lessons: lessons,
                    pageManager: pageManager,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(top: 8, right: 8, child: SheetCloseButton()),
        ],
      ),
    );
  }
}
