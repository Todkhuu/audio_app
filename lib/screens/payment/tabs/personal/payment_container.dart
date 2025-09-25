import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:flutter/material.dart';

class PaymentContainer extends StatelessWidget {
  final AudioLesson lesson;
  const PaymentContainer({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF4F6F8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Үндсэн төлбөр',
            style: TextStyle(color: Color(0xFF33547D), fontSize: 12),
          ),
          Text(
            '${lesson.price}₮',
            style: TextStyle(
              color: Color(0xFF33547D),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
