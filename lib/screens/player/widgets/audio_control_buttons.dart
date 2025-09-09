import 'package:audio_app_2/screens/player/player_buttons/forward_10_button.dart';
import 'package:audio_app_2/screens/player/player_buttons/next_button.dart';
import 'package:audio_app_2/screens/player/player_buttons/play_button.dart';
import 'package:audio_app_2/screens/player/player_buttons/previous_button.dart';
import 'package:audio_app_2/screens/player/player_buttons/repeat_button.dart';
import 'package:audio_app_2/screens/player/player_buttons/rewind_5_button.dart';
import 'package:audio_app_2/screens/player/player_buttons/speed_button.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PreviousSongButton(pageManager: pageManager),
          SpeedButton(pageManager: pageManager),
          Rewind5Button(pageManager: pageManager),
          PlayButton(pageManager: pageManager),
          Forward10Button(pageManager: pageManager),
          RepeatButton(pageManager: pageManager),
          NextSongButton(pageManager: pageManager),
        ],
      ),
    );
  }
}
