import 'package:audio_app_2/notifiers/repeat_button_notifier.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class RepeatButton extends StatelessWidget {
  const RepeatButton({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<RepeatState>(
      valueListenable: pageManager.repeatButtonNotifier,
      builder: (context, value, child) {
        Image image;
        switch (value) {
          case RepeatState.off:
            image = Image.asset(
              'assets/images/audio_control/reload.png',
              width: 16,
              color: Color(0xFFCAD0D7).withOpacity(0.4),
            );
            break;
          case RepeatState.repeatSong:
            image = Image.asset('assets/images/audio_control/1.png', width: 16);
            break;
          case RepeatState.repeatPlaylist:
            image = Image.asset(
              'assets/images/audio_control/reload.png',
              width: 16,
            );
            break;
        }
        return IconButton(
          icon: image,
          onPressed: pageManager.onRepeatButtonPressed,
        );
      },
    );
  }
}
