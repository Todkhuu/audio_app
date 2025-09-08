// widgets/info_card_widget.dart
import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    super.key,
    required this.iconPath,
    required this.text,
    this.iconColor,
  });

  final String iconPath;
  final String text;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFF4F6F8), width: 1.5),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 11, bottom: 11),
        child: Row(
          children: [
            Image.asset(iconPath, width: 16, color: iconColor ?? null),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA9B0BB),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
