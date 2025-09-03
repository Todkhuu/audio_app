import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class NextSongButton extends StatelessWidget {
  const NextSongButton({super.key, required this.pageManager});
  final PageManager pageManager;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: Image.asset(
            'assets/images/next.png',
            width: 17,
            color: isLast ? Color(0xFFCAD0D7) : null,
          ),
          onPressed: (isLast) ? null : pageManager.onNextSongButtonPressed,
        );
      },
    );
  }
}
