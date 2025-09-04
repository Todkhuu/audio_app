import 'package:audio_app_2/components/action_buttons.dart';
import 'package:audio_app_2/components/app_bar.dart';
import 'package:audio_app_2/components/audio_control_buttons.dart';
import 'package:audio_app_2/components/lesson_info.dart';
import 'package:audio_app_2/components/lessons_bottom_sheet.dart';
import 'package:audio_app_2/components/progress_bar.dart';
import 'package:audio_app_2/components/waveform_painter.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  final AudioLesson lesson;
  final PageManager pageManager;

  const PlayerScreen({
    super.key,
    required this.lesson,
    required this.pageManager,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    _playLesson();
  }

  void _playLesson() async {
    // Assets файл эсэх шалгах
    if (widget.lesson.audioPath.startsWith('assets')) {
      await widget.pageManager.playAssetLesson(widget.lesson);
    } else {
      // Download хийгдсэн файл
      await widget.pageManager.playDownloadedLesson(widget.lesson);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomLessonAppBar(title: 'Өдөр 3'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/bg.png'),
            ActionButtons(pageManager: widget.pageManager),
            LessonInfo(pageManager: widget.pageManager),
            WaveformPainter(pageManager: widget.pageManager),
            AudioProgressBar(pageManager: widget.pageManager),
            AudioControlButtons(pageManager: widget.pageManager),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LessonsBottomSheet(pageManager: widget.pageManager),

                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Тэмдэглэл (0)'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
