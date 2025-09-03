import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class SpeedButton extends StatelessWidget {
  const SpeedButton({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: pageManager.speedNotifier,
      builder: (_, speed, __) {
        Widget icon;
        if (speed.toInt() == 1) {
          icon = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/1x.png',
                width: 9,
                height: 14,
                color: Color(0xFFCAD0D7),
              ),
              Image.asset(
                'assets/images/x1.png',
                width: 8,
                height: 9,
                color: Color(0xFFCAD0D7),
              ),
            ],
          );
        } else if (speed.toInt() == 2) {
          icon = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/2.png',
                width: 9,
                height: 14,
                color: Color(0xFFCAD0D7),
              ),
              Image.asset(
                'assets/images/x2.png',
                width: 8,
                height: 9,
                color: Color(0xFFCAD0D7),
              ),
            ],
          );
        } else {
          icon = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/3.png',
                width: 9,
                height: 14,
                color: Color(0xFFCAD0D7),
              ),
              Image.asset(
                'assets/images/x3.png',
                width: 8,
                height: 9,
                color: Color(0xFFCAD0D7),
              ),
            ],
          );
        }

        return GestureDetector(
          onTap: pageManager.cycleSpeed,
          child: Container(child: icon),
        );
      },
    );
  }
}
