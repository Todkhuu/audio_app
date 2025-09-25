import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/payment/widgets/bottom_sheet/payment_bottom_sheet.dart';
import 'package:audio_app_2/screens/payment/widgets/price_tag.dart';
import 'package:flutter/material.dart';

/// Main Pay Button
class PayButton extends StatelessWidget {
  final int price;
  final String text;
  final AudioLesson lesson;

  const PayButton({
    super.key,
    required this.price,
    required this.text,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) =>
                  PaymentBottomSheet(price: price, text: text, lesson: lesson),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF33547D),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 7,
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              PriceTag(price: price),
            ],
          ),
        ),
      ),
    );
  }
}
