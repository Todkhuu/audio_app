import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget {
  const TitleLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Төрсөн өдөр оруулах",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 27 / 14,
            color: Color(0xFF33547D),
          ),
        ),
      ),
    );
  }
}
