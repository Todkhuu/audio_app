import 'package:flutter/material.dart';
import 'package:audio_app_2/shared/styled_text.dart';

class LessonInfo extends StatelessWidget {
  const LessonInfo({
    super.key,
    required this.title,
    required this.mentor,
    required this.remainingDays,
    required this.price,
  });

  final String title;
  final String mentor;
  final String remainingDays;
  final int price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StyledBodyText(title),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.person, size: 12, color: Color(0xFFCAD0D7)),
                  const SizedBox(width: 5),
                  StyledThinGreyText(mentor),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_sharp,
                    size: 11.57,
                    color: Color(0xFFCAD0D7),
                  ),
                  const SizedBox(width: 5),
                  StyledThinGreyText('$remainingDays хоног'),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.discount_rounded,
                    size: 11.57,
                    color: Color(0xFFCAD0D7),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    price > 0 ? "${price.toInt()}₮" : 'Үнэгүй',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: price > 0
                          ? const Color(0xFFE8553E)
                          : const Color(0xFFA9B0BB),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
