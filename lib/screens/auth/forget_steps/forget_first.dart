import 'package:audio_app_2/utils/input_decoration_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
          Text(
            'Нууц үг сэргээх',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF33547D),
            ),
          ),
          SizedBox(height: 25),
          Text(
            'Та өөрийн бүртгэлтэй утасны дугаараа оруулна уу',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFF33547D),
              height: 17 / 14,
            ),
          ),
          SizedBox(height: 26),
          Form(
            key: formKey,
            child: Row(
              children: [
                // УЛСЫН КОД
                Container(
                  width: 116,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IntlPhoneField(
                    showDropdownIcon: false,
                    showCountryFlag: true,
                    disableLengthCheck: true,
                    initialCountryCode: 'MN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                // УТАСНЫ ДУГААР
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
