import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/notifiers/progress_notifier.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class AudioProgressBar extends StatelessWidget {
  final PageManager pageManager;
  const AudioProgressBar({super.key, required this.pageManager});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 29,
      left: 35,
      right: 35,
      child: ValueListenableBuilder<ProgressBarState>(
        valueListenable: pageManager.progressNotifier,
        builder: (_, value, __) {
          return ProgressBar(
            progress: value.current,
            buffered: value.buffered,
            total: value.total,
            timeLabelTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            timeLabelLocation: TimeLabelLocation.above,
            onSeek: pageManager.seek,
            thumbColor: Colors.white,
            baseBarColor: const Color(0xFFE4E8EB),
            progressBarColor: Colors.white,
          );
        },
      ),
    );
  }
}
