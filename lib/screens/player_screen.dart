import 'package:audio_app_2/components/action_buttons.dart';
import 'package:audio_app_2/components/audio_control_buttons.dart';
import 'package:audio_app_2/components/lesson_info.dart';
import 'package:audio_app_2/components/progress_bar.dart';
import 'package:audio_app_2/components/waveform_painter.dart';
import 'package:audio_app_2/page_manager.dart';
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
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/left.png'),
              ),
              Text(
                'Өдөр 3',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF33547D),
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/bg.png'),
            ActionButtons(),
            LessonInfo(pageManager: _pageManager),
            WaveformPainter(pageManager: _pageManager),
            AudioProgressBar(pageManager: _pageManager),
            AudioControlButtons(pageManager: _pageManager),
          ],
        ),
      ),
    );
  }
}
