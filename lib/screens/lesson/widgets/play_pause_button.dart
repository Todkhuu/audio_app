import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/notifiers/play_button_notifier.dart';
import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final PageManager pageManager;
  const PlayPauseButton({super.key, required this.pageManager});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: ValueListenableBuilder<ButtonState>(
          valueListenable: pageManager.playButtonNotifier,
          builder: (_, state, __) {
            final isPlaying = state == ButtonState.playing;
            return GestureDetector(
              onTap: () {
                if (isPlaying) {
                  pageManager.pause();
                } else {
                  pageManager.play();
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                padding: const EdgeInsets.all(12),
                child: Icon(
                  isPlaying ? Icons.pause_outlined : Icons.play_arrow_outlined,
                  size: 35,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
