import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class ScreensHeader extends StatelessWidget implements PreferredSizeWidget {
  const ScreensHeader({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/left.png',
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(width: 0),
              StyledBodyText(text),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
