import 'package:flutter/material.dart';
import 'package:audio_app_2/shared/styled_text.dart';

class InfoTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? subtitle;

  const InfoTile({
    super.key,
    required this.imagePath,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 35),
            const SizedBox(width: 10),
            if (subtitle != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledThinGreyText(subtitle!),
                  StyledBodyText(title),
                ],
              )
            else
              StyledBodyText(title),
            const Spacer(),
            Image.asset('assets/images/signup/check.png', width: 16.6),
          ],
        ),
      ),
    );
  }
}
