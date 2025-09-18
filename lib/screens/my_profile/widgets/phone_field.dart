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
          width: 116,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: const Text('+976'),
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
