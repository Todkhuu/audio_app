// widgets/lesson_info_widget.dart
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class LessonInfoWidget extends StatelessWidget {
  const LessonInfoWidget({
    super.key,
    required this.title,
    required this.remainingDays,
    required this.price,
  });

  final String title;
  final String remainingDays;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledSmallBodyText(title),
        const SizedBox(height: 21),
        Row(
          children: [
            const Icon(Icons.person, size: 12, color: Color(0xFFCAD0D7)),
            const SizedBox(width: 5),
            StyledThinGreyText('Менторгүй'),
          ],
        ),
        // Duration
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
        // Price
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
    );
  }
}
