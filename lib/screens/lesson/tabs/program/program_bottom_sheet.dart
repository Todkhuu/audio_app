import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/player/widgets/audio_control_buttons.dart';
import 'package:audio_app_2/screens/player/widgets/lesson_info.dart';
import 'package:audio_app_2/screens/player/widgets/progress_bar.dart';
import 'package:audio_app_2/screens/player/widgets/waveform_painter.dart';
import 'package:flutter/material.dart';

class ProgramBottomSheet extends StatefulWidget {
  const ProgramBottomSheet({
    super.key,
    required this.lesson,
    required this.pageManager,
  });
  final AudioLesson lesson;
  final PageManager pageManager;

  @override
  State<ProgramBottomSheet> createState() => _ProgramBottomSheetState();
}

class _ProgramBottomSheetState extends State<ProgramBottomSheet> {
  @override
  void initState() {
    super.initState();
    _playLesson();
  }

  void _playLesson() async {
    final path = widget.lesson.audioPath;

    if (path.startsWith('assets')) {
      // assets дээрх аудио
      await widget.pageManager.playAssetLesson(widget.lesson);
    } else if (path.startsWith('http')) {
      // network URL
      await widget.pageManager.playNetworkLesson(widget.lesson);
    } else {
      // татаж авсан local файл
      await widget.pageManager.playDownloadedLesson(widget.lesson);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 55,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xFFE1E6EF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Color(0xFFA9B0BB),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(widget.lesson.bgImage),
          LessonInfo(lesson: widget.lesson),
          WaveformPainter(pageManager: widget.pageManager),
          AudioProgressBar(pageManager: widget.pageManager),
          AudioControlButtons(pageManager: widget.pageManager),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
