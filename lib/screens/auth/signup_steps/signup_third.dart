import 'package:audio_app_2/screens/auth/signup_steps/second/second_header.dart';
import 'package:audio_app_2/screens/auth/signup_steps/third/dashed_divider_col.dart';
import 'package:audio_app_2/screens/auth/signup_steps/third/key_card.dart';
import 'package:audio_app_2/screens/auth/signup_steps/third/step_num.dart';
import 'package:flutter/material.dart';

class SignupThird extends StatelessWidget {
  const SignupThird({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 0),
            SecondHeader(),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    StepNum(num: '1'),
                    DashedDividerCol(height: 98),
                    StepNum(num: '2'),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      KeyCard(
                        green: 'Түлхүүр үгийг ',
                        green1: 'Хуулах',
                        green2: ' товчин дээр дарж хуулна уу',
                        imageUrl: 'assets/images/signup/key.png',
                        cardHeader: 'Түлхүүр үг',
                        cardText: 'Jargaa888',
                        buttonText: 'Хуулах',
                      ),
                      const SizedBox(height: 25),
                      KeyCard(
                        green: 'Хуулсан түлхүүр үгээ ',
                        green1: 'Чат',
                        green2:
                            ' товчин дээр дараад Көүч, багш Жаргаа хуудасны чатруу явуулна уу',
                        imageUrl: 'assets/images/signup/fb.png',
                        cardHeader: 'Facebook хуудас',
                        cardText: 'Көүч, багш Жаргаа',
                        buttonText: 'Чат',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Form(key: formKey, child: Column()),
          ],
        ),
      ),
    );
  }
}
