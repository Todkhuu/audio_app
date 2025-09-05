import 'package:audio_app_2/managers/auth_manager.dart';
import 'package:audio_app_2/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  bool _codeSent = false;

  @override
  Widget build(BuildContext context) {
    final authManager = context.watch<AuthManager>();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: "Утасны дугаар"),
            validator: Validators.validatePhone,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 10),
          if (_codeSent)
            TextFormField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: "4 оронтой код"),
              validator: Validators.validateCode,
              keyboardType: TextInputType.number,
            ),
          const SizedBox(height: 20),
          authManager.isLoading
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (!_codeSent) {
                            await authManager.sendCode(_phoneController.text);
                            setState(() => _codeSent = true);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Код илгээлээ")),
                            );
                          } else {
                            await authManager.signupVerify(
                              _phoneController.text,
                              _codeController.text,
                            );
                            if (authManager.isLoggedIn) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Амжилттай бүртгэгдлээ"),
                                ),
                              );
                              Navigator.pop(context);
                            }
                          }
                        }
                      },
                      child: Text(_codeSent ? "Бүртгүүлэх" : "Код авах"),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.facebook),
                      label: const Text("Facebook"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                      ),
                      onPressed: () async {
                        await authManager.signupWithFacebook();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Facebook-ээр бүртгэгдлээ"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
