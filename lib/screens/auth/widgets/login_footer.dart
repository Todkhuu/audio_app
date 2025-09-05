import 'package:audio_app_2/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Бүртгэл үүсгэх үү?',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFFA9B0BB),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            );
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(left: 3),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Бүртгүүлэх',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF33547D),
            ),
          ),
        ),
      ],
    );
  }
}
