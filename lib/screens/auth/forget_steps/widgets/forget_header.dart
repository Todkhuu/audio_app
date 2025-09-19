import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class ForgetHeader extends StatelessWidget {
  final String text;
  final String text2;
  const ForgetHeader({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledBodyText(text),
        SizedBox(height: 25),
        SizedBox(
          width: 300,
          child: Text(
            text2,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFF33547D),
            ),
          ),
        ),
      ],
    );
  }
}
