import 'package:audio_app_2/common/info_card_widget.dart';
import 'package:flutter/material.dart';

class EnrollmentInfoRow extends StatelessWidget {
  const EnrollmentInfoRow({super.key, required this.cards});

  final List<InfoCardWidget> cards;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < cards.length; i++) ...[
          Expanded(child: cards[i]),
          if (i != cards.length - 1) const SizedBox(width: 6),
        ],
      ],
    );
  }
}
