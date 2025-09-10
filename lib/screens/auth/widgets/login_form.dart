import 'package:audio_app_2/managers/auth_manager.dart';
import 'package:audio_app_2/screens/auth/forget_screen.dart';
import 'package:audio_app_2/screens/bottom_navigation_bar/audio_app_bottom_nav.dart';
import 'package:audio_app_2/screens/auth/widgets/face_id_dialog.dart';
import 'package:audio_app_2/shared/styled_text.dart';
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetScreen()),
                );
              },
              child: StyledThinGreyText('Нууц үг мартсан'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 245,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await authManager.login(
                            _identifierController.text.trim(),
                            _passwordController.text,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AudioAppBottomNav(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF33547D),
                        foregroundColor: Colors.white,
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
                              style: TextStyle(fontSize: 14),
                            ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 10),

              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  icon: Image.asset('assets/images/auth/face.png', width: 24),
                  tooltip: "Face ID-ээр нэвтрэх",
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFF33547D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    FaceIDDialog.show(
                      context: context,
                      authManager: authManager,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
