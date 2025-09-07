import 'package:audio_app_2/common/auth_logo.dart';
import 'package:audio_app_2/screens/auth/widgets/login_footer.dart';
import 'package:audio_app_2/screens/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const AuthLogo(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LoginForm(),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(top: 103),
                child: LoginFooter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
