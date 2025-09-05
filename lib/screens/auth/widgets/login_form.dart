import 'package:audio_app_2/managers/auth_manager.dart';
import 'package:audio_app_2/screens/auth/widgets/face_id_dialog.dart';
import 'package:audio_app_2/utils/input_decoration_helper.dart';
import 'package:audio_app_2/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authManager = context.watch<AuthManager>();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 45),

          TextFormField(
            controller: _identifierController,
            decoration: InputDecorationHelper().buildInputDecoration(
              "Утасны дугаар эсвэл И-Мэйл",
            ),
            validator: Validators.validateIdentifier,
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecorationHelper().buildInputDecoration("Нууц үг"),
            validator: Validators.validatePassword,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Нууц үг мартсан',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFFA9B0BB),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Нэвтрэх товч
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await authManager.login(
                          _identifierController.text.trim(),
                          _passwordController.text,
                        );

                        if (authManager.errorMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(authManager.errorMessage!)),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF33547D),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    child: authManager.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            "Нэвтрэх",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                  ),
                ],
              ),

              const SizedBox(width: 10),

              IconButton(
                icon: Image.asset('assets/images/auth/face.png', width: 24),
                tooltip: "Face ID-ээр нэвтрэх",
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF33547D),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  FaceIDDialog.show(context: context, authManager: authManager);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
