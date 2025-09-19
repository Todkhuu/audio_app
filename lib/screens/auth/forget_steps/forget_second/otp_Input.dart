import 'package:audio_app_2/controller/otp_controller.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final OtpController controller;
  final void Function(String) onCompleted;

  const OtpInput({
    super.key,
    required this.controller,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(controller.length, (index) {
        return SizedBox(
          width: 73,
          height: 55,
          child: TextFormField(
            controller: controller.controllers[index],
            focusNode: controller.focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              counterText: '',
              hintText: '-',
              hintStyle: TextStyle(color: Color(0xFF33547D), fontSize: 25),
              filled: true,
              fillColor: Colors.white, // TextField-ийн дэвсгэр өнгө
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
              ), // Text-ийн padding
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onChanged: (value) =>
                controller.onChanged(value, index, onCompleted),
          ),
        );
      }),
    );
  }
}
