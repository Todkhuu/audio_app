import 'package:audio_app_2/components/action_buttons.dart';
import 'package:audio_app_2/components/app_bar.dart';
import 'package:audio_app_2/components/audio_control_buttons.dart';
import 'package:audio_app_2/components/lesson_info.dart';
import 'package:audio_app_2/components/lessons_bottom_sheet.dart';
import 'package:audio_app_2/components/progress_bar.dart';
import 'package:audio_app_2/components/waveform_painter.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

late final PageManager _pageManager;

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
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
            ActionButtons(pageManager: _pageManager),
            LessonInfo(pageManager: _pageManager),
            WaveformPainter(pageManager: _pageManager),
            AudioProgressBar(pageManager: _pageManager),
            AudioControlButtons(pageManager: _pageManager),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LessonsBottomSheet(pageManager: _pageManager),

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
