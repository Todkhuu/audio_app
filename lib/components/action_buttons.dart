import 'package:audio_app_2/components/action_buttons/completed_button.dart';
import 'package:audio_app_2/components/action_buttons/download_button.dart';
import 'package:audio_app_2/components/action_buttons/info_button.dart';
import 'package:audio_app_2/components/action_buttons/like_button.dart';
import 'package:audio_app_2/page_manager.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InfoButton(pageManager: pageManager),
          LikeButton(pageManager: pageManager),
          DownloadButton(),
          CompletedButton(),
        ],
      ),
    );
  }
}
