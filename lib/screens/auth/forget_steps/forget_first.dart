import 'package:audio_app_2/screens/auth/forget_steps/forget_first/country_phone_selector.dart';
import 'package:audio_app_2/screens/auth/forget_steps/widgets/forget_header.dart';
import 'package:audio_app_2/utils/input_decoration_helper.dart';
import 'package:flutter/material.dart';
import 'package:audio_app_2/utils/validators.dart';

class ForgetFirst extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ForgetFirst({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 63),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ForgetHeader(
            text: 'Нууц үг сэргээх',
            text2: 'Та өөрийн бүртгэлтэй утасны дугаараа оруулна уу',
          ),
          SizedBox(height: 26),
          Form(
            key: formKey,
            child: Row(
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
        ],
      ),
    );
  }
}
