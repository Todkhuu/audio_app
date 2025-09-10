import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/payment/tabs/personal/coupon_button.dart';
import 'package:audio_app_2/screens/payment/tabs/personal/lesson_info_row.dart';
import 'package:audio_app_2/common/dashed_divider.dart';
import 'package:audio_app_2/screens/payment/widgets/pay_button.dart';
import 'package:flutter/material.dart';

class PersonalTab extends StatelessWidget {
  const PersonalTab({super.key, required this.lesson});
  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                LessonInfoRow(title: 'Хичээл', value: lesson.title),
                const DashedDivider(),
                LessonInfoRow(title: 'Төлөх дүн', value: '${lesson.price}₮'),
                const DashedDivider(),
                const LessonInfoRow(title: 'НӨАТ', value: 'Хувь хүн'),
              ],
            ),
          ),
          const CouponButton(),
          const Expanded(child: SizedBox()),
          PayButton(price: lesson.price, text: 'Төлбөр төлөх'),
        ],
      ),
    );
  }
}
