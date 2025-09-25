import 'package:audio_app_2/screens/auth/forget_steps/forget_first/country_phone_selector.dart';
import 'package:audio_app_2/screens/auth/forget_steps/widgets/forget_header.dart';
import 'package:audio_app_2/screens/auth/signup_steps/first/contact_box.dart';
import 'package:audio_app_2/screens/auth/signup_steps/first/terms_checkbox.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:audio_app_2/utils/input_decoration_helper.dart';
import 'package:audio_app_2/utils/validators.dart';
import 'package:flutter/material.dart';

class SignupFirst extends StatelessWidget {
  const SignupFirst({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 48),
        ForgetHeader(
          text: 'Утасны дугаараа оруулна уу',
          text2: 'Та өөрийн тогтмол ашигладаг утасны дугаараа оруулна уу',
        ),
        const SizedBox(height: 26),
        Form(
          key: formKey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 105,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(left: 10),
                child: CountryPhoneSelector(),
              ),

              SizedBox(width: 10),

              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecorationHelper().buildInputDecoration(
                    "Утасны дугаар",
                  ),
                  validator: Validators.validatePhone,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        TermsCheckbox(),
        Spacer(),
        StyledThinGreyText(
          'Та дараах 2 баталгаажуулалтыг хийснээр нэвтрэх боломжтой болно',
        ),
        SizedBox(height: 12),
        ContactBox(
          imgUrl: 'assets/images/signup/phone.png',
          text: 'Таны утасны дугаар',
        ),
        SizedBox(height: 15),
        ContactBox(
          imgUrl: 'assets/images/signup/fb.png',
          text: 'Таны Facebook хаяг',
        ),
        SizedBox(height: 35),
      ],
    );
  }
}
