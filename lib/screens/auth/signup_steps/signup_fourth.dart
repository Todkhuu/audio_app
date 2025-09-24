import 'package:audio_app_2/controller/otp_controller.dart';
import 'package:audio_app_2/screens/auth/forget_steps/forget_second/otp_Input.dart';
import 'package:audio_app_2/screens/auth/forget_steps/widgets/forget_header.dart';
import 'package:flutter/material.dart';

class SignupFourth extends StatefulWidget {
  const SignupFourth({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<SignupFourth> createState() => _SignupFourthState();
}

class _SignupFourthState extends State<SignupFourth> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ForgetHeader(
            text: 'Facebook хаягаа баталгаажуулна уу',
            text2:
                'Көүч, багш Жаргаа хуудаснаас чатаас ирсэн 6 оронтой кодыг оруулна уу',
          ),
          const SizedBox(height: 26),
          Form(
            key: widget.formKey,
            child: OtpInput(
              controller: OtpController(),
              onCompleted: (otp) {
                print('Оруулсан код: $otp');
              },
            ),
          ),
        ],
      ),
    );
  }
}
