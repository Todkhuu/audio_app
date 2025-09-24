import 'package:audio_app_2/controller/otp_controller.dart';
import 'package:audio_app_2/screens/auth/forget_steps/forget_second/otp_Input.dart';
import 'package:audio_app_2/screens/auth/forget_steps/widgets/forget_header.dart';
import 'package:flutter/material.dart';

class SignupSecond extends StatefulWidget {
  const SignupSecond({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<SignupSecond> createState() => _SignupSecondState();
}

class _SignupSecondState extends State<SignupSecond> {
  late OtpController otpController;

  @override
  void initState() {
    super.initState();
    otpController = OtpController(length: 4);
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ForgetHeader(
            text: 'Утасны дугаараа баталгаажуулна уу',
            text2:
                'Таны бүртгэлтэй утасны дугаарлуу илгээсэн 4 оронтой кодыг оруулна уу',
          ),
          const SizedBox(height: 26),
          Form(
            key: widget.formKey,
            child: OtpInput(
              controller: otpController,
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
