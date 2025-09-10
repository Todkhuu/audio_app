import 'package:audio_app_2/utils/validators.dart';
import 'package:flutter/material.dart';

class ForgetSecond extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ForgetSecond({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Message код'),
                validator: Validators.validateCode,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
