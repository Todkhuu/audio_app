import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/auth/authlogo.png', width: 100),
        const SizedBox(height: 15),
        StyledBodyText('Jargaa app'),
        const SizedBox(height: 15),
        StyledGreyText('Тавтай морилно уу!'),
      ],
    );
  }
}
