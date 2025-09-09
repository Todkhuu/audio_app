import 'package:audio_app_2/common/info_card_widget.dart';
import 'package:audio_app_2/components/lesson/buy_button.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

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
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF33547D),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InfoCardWidget(
                iconPath: 'assets/images/card/user.png',
                text: 'Менторгүй хөтөлбөр',
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: InfoCardWidget(
                iconPath: 'assets/images/card/calendar.png',
                text: 'Хичээл үзэх хугацаа ${lesson.remainingDays} хоног',
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: InfoCardWidget(
                iconPath: 'assets/images/audio_control/play.png',
                text: 'Нийт 113 хичээл багтсан',
                iconColor: Color(0xFFCAD0D7),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: InfoCardWidget(
                iconPath: 'assets/images/card/graph.png',
                text: 'Анхан шатны сургалт',
              ),
            ),
          ],
        ),

        lesson.category != 'Үнэгүй сургалт'
            ? Text(
                'Хөнгөлөлт дуусах хугацаа',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFFA9B0BB),
                ),
              )
            : const SizedBox.shrink(),
        if (pageManager.getCountdownNotifier(lesson.lessonNumber) != null)
          ValueListenableBuilder<Duration>(
            valueListenable: pageManager.getCountdownNotifier(
              lesson.lessonNumber,
            )!,
            builder: (context, remaining, child) {
              final text = remaining.inSeconds > 0
                  ? PageManager.formatDuration(remaining)
                  : 'Дууссан';
              return Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Color(0xFFE8553E),
                ),
              );
            },
          ),

        Expanded(child: SizedBox()),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Color(0xFFf2f5f7),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Хичээл',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF33547D),
                      ),
                    ),
                    Text(
                      lesson.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        height: 15 / 14,
                        fontSize: 12,
                        color: Color(0xFF33547D),
                      ),
                    ),
                  ],
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Dash(
                    direction: Axis.horizontal,
                    length: constraints.maxWidth,
                    dashLength: 4.5,
                    dashThickness: 0.25,
                    dashColor: Color(0xFF33547D),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Төлөх дүн',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF33547D),
                      ),
                    ),
                    Text(
                      lesson.price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        height: 15 / 14,
                        fontSize: 12,
                        color: Color(0xFF33547D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
