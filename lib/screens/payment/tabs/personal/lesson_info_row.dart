import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class LessonInfoRow extends StatelessWidget {
  const LessonInfoRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [StyledSmallthinBodyText(title), StyledSmallBodyText(value)],
      ),
    );
  }
}
