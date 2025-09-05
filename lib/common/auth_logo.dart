import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/auth/authlogo.png', width: 100),
        const SizedBox(height: 15),
        Text(
          'Jargaa app',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 18.54 / 14,
            color: Color(0xFF33547D),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Тавтай морилно уу!',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 18.54 / 14,
            color: Color(0xFFA9B0BB),
          ),
        ),
      ],
    );
  }
}
