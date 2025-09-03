import 'package:audio_app_2/components/buttons/forward_10_button.dart';
import 'package:audio_app_2/components/buttons/next_button.dart';
import 'package:audio_app_2/components/buttons/play_button.dart';
import 'package:audio_app_2/components/buttons/previous_button.dart';
import 'package:audio_app_2/components/buttons/repeat_button.dart';
import 'package:audio_app_2/components/buttons/rewind_5_button.dart';
import 'package:audio_app_2/components/buttons/speed_button.dart';
import 'package:audio_app_2/page_manager.dart';
import 'package:flutter/material.dart';

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
