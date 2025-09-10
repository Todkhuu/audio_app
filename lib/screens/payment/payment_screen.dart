import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/screens/payment/tabs/business_tab.dart';
import 'package:audio_app_2/screens/payment/tabs/personal_tab.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.lesson});
  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensHeader(text: 'Төлбөр төлөлт'),
      body: DefaultTabController(
        length: 2,
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 15,
            bottom: 15,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 40,
                  width: 218,
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Color(0xFFCAD0D7),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      height: 25 / 14,
                    ),
                    indicator: BoxDecoration(
                      color: Color(0xFF33547D),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.zero,
                    indicatorColor: Colors.transparent,
                    indicatorWeight: 0,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(text: "Хувь хүн"),
                      Tab(text: "Байгууллага"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PersonalTab(lesson: lesson),
                    BusinessTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
