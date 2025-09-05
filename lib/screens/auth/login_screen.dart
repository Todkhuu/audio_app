import 'package:audio_app_2/common/auth_logo.dart';
import 'package:audio_app_2/screens/auth/widgets/login_footer.dart';
import 'package:audio_app_2/screens/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 100), child: AuthLogo()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LoginForm(),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(bottom: 53),
            child: LoginFooter(),
          ),
        ],
      ),
    );
  }
}
