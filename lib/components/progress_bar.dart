import 'package:audio_app_2/notifiers/progress_notifier.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class AudioProgressBar extends StatelessWidget {
  final PageManager pageManager;

  const AudioProgressBar({super.key, required this.pageManager});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          timeLabelTextStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          onSeek: pageManager.seek,
          thumbColor: const Color(0xFFF5B945),
          baseBarColor: const Color(0xFFE4E8EB),
          progressBarColor: const Color(0xFFF5B945),
        );
      },
    );
  }
}
