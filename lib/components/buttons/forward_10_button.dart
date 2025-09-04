import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class Forward10Button extends StatelessWidget {
  const Forward10Button({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/audio_control/10sec.png', width: 36),
      onPressed: pageManager.forward10Seconds,
      tooltip: "10 секундээр урагшлах",
    );
  }
}
