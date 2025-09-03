import 'package:audio_app_2/page_manager.dart';
import 'package:flutter/material.dart';

class Rewind5Button extends StatelessWidget {
  const Rewind5Button({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/5sec.png', width: 36),
      onPressed: pageManager.rewind5Seconds,
      tooltip: "5 секундээр буцах",
    );
  }
}
