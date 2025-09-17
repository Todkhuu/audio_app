import 'package:audio_app_2/screens/lesson/tabs/program/program_bottom_sheet.dart';
import 'package:audio_app_2/screens/lesson/widgets/buy_button.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/payment/payment_screen.dart';
import 'package:audio_app_2/utils/format_helper.dart';
import 'package:flutter/material.dart';

class ProgramTab extends StatelessWidget {
  const ProgramTab({
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
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Text(
                'Бүх хичээл ',
                style: TextStyle(
                  color: Color(0xFF33547D),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 27 / 14,
                ),
              ),
              Text(
                '(10)',
                style: TextStyle(
                  color: Color(0xFFA9B0BB),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 27 / 14,
                ),
              ),
            ],
          ),
        ),

        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              builder: (context) =>
                  ProgramBottomSheet(lesson: lesson, pageManager: pageManager),
            );

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         PlayerScreen(lesson: lesson, pageManager: pageManager),
            //   ),
            // );
          },
          child: Card(
            elevation: 0,
            color: Color(0xFFF4F6F8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
              child: Row(
                children: [
                  Image.asset('assets/images/song.png', width: 34),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.lessonName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF33547D),
                          height: 27 / 14,
                        ),
                      ),
                      Text(
                        "${lesson.lessonNumber} • ${lesson.startTime} • ${FormatHelper.formatDurations(lesson.duration)}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA9B0BB),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
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
