import 'package:flutter/material.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20), child: SignupForm()),
      ),
    );
  }
}
