import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/payment/tabs/personal/coupon_button.dart';
import 'package:audio_app_2/screens/payment/tabs/personal/lesson_info_row.dart';
import 'package:audio_app_2/common/dashed_divider.dart';
import 'package:audio_app_2/screens/payment/tabs/personal/payment_container.dart';
import 'package:audio_app_2/screens/payment/widgets/pay_button.dart';
import 'package:flutter/material.dart';

class PersonalTab extends StatelessWidget {
  const PersonalTab({super.key, required this.lesson});
  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              LessonInfoRow(title: 'Хөтөлбөр', value: lesson.title),
              const DashedDivider(),
              const LessonInfoRow(title: 'НӨАТ', value: 'Хувь хүн'),
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
            child: Column(
              children: [
                const CouponButton(),
                const SizedBox(height: 15),
                PaymentContainer(lesson: lesson),
                const SizedBox(height: 15),
                PayButton(
                  price: lesson.price,
                  text: 'Төлбөр төлөх',
                  lesson: lesson,
                ),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
