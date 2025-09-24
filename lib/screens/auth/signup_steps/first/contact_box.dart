import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class ContactBox extends StatelessWidget {
  final String imgUrl;
  final String text;
  const ContactBox({super.key, required this.imgUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(imgUrl, width: 35),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledThinGreyText(text),
              Text('---', style: TextStyle(color: Color(0xFFE8553E))),
            ],
          ),
        ],
      ),
    );
  }
}
