import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({super.key, required this.pageManager});
  final PageManager pageManager;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: Image.asset(
            'assets/images/previous.png',
            width: 17,
            color: isFirst ? Color(0xFFCAD0D7) : null,
          ),
          onPressed: (isFirst) ? null : pageManager.onPreviousSongButtonPressed,
        );
      },
    );
  }
}
