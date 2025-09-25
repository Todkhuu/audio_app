import 'package:audio_app_2/screens/auth/forget_steps/forget_first/country_phone_selector.dart';
import 'package:audio_app_2/screens/my_profile/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 105,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.only(left: 10),
          child: CountryPhoneSelector(),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomTextField(
            controller: controller,
            label: 'Утасны дугаар',
          ),
        ),
      ],
    );
  }
}
