import 'package:audio_app_2/notifiers/play_button_notifier.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, required this.pageManager});
  final PageManager pageManager;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child: CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return IconButton(
              icon: Image.asset(
                'assets/images/audio_control/play.png',
                width: 55,
                color: Color(0xFFCAD0D7),
              ),
              onPressed: pageManager.play,
            );
          case ButtonState.playing:
            return IconButton(
              icon: Image.asset(
                'assets/images/audio_control/play.png',
                width: 55,
              ),
              onPressed: pageManager.pause,
            );
        }
      },
    );
  }
}
