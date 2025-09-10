import 'package:audio_app_2/common/info_card_widget.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/category/widgets/lesson_discount_timer.dart';
import 'package:audio_app_2/screens/lesson/tabs/enrollment/enrollment_info_row.dart';
import 'package:audio_app_2/screens/lesson/tabs/enrollment/lesson_payment_summary.dart';
import 'package:audio_app_2/screens/lesson/widgets/buy_button.dart';
import 'package:audio_app_2/screens/payment/payment_screen.dart';
import 'package:flutter/material.dart';

class EnrollmentTab extends StatelessWidget {
  const EnrollmentTab({
    super.key,
    required this.lesson,
    required this.pageManager,
  });

  final AudioLesson lesson;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            lesson.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF33547D),
            ),
          ),
        ),
        EnrollmentInfoRow(
          cards: [
            InfoCardWidget(
              iconPath: 'assets/images/card/user.png',
              text: 'Менторгүй хөтөлбөр',
            ),
            InfoCardWidget(
              iconPath: 'assets/images/card/calendar.png',
              text: 'Хичээл үзэх хугацаа ${lesson.remainingDays} хоног',
            ),
          ],
        ),
        const SizedBox(height: 4),
        EnrollmentInfoRow(
          cards: [
            InfoCardWidget(
              iconPath: 'assets/images/audio_control/play.png',
              text: 'Нийт 113 хичээл багтсан',
              iconColor: const Color(0xFFCAD0D7),
            ),
            InfoCardWidget(
              iconPath: 'assets/images/card/graph.png',
              text: 'Анхан шатны сургалт',
            ),
          ],
        ),
        LessonDiscountTimer(
          lessonNumber: lesson.lessonNumber,
          pageManager: pageManager,
        ),
        const Spacer(),
        LessonPaymentSummary(lesson: lesson),
        if (lesson.category == 'Үнэгүй сургалт') const SizedBox(height: 20),
        BuyButton(
          price: lesson.price,
          text: 'Худалдаж авах',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentScreen(lesson: lesson),
              ),
            );
          },
        ),
      ],
    );
  }
}
