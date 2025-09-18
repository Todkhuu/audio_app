import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/managers/auth_manager.dart';
import 'package:audio_app_2/utils/input_decoration_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldController = TextEditingController();
  final _newController = TextEditingController();
  final _repeatController = TextEditingController();

  @override
  void dispose() {
    _oldController.dispose();
    _newController.dispose();
    _repeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authManager = context.watch<AuthManager>();

    return Scaffold(
      appBar: ScreensHeader(text: 'Нууц үг солих'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _oldController,
                decoration: InputDecorationHelper().buildInputDecoration(
                  "Хуучин нууц үг оруулах",
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _newController,
                obscureText: true,
                decoration: InputDecorationHelper().buildInputDecoration(
                  "Шинэ нууц үг оруулах",
                ),
                // validator: Validators.validatePassword,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _repeatController,
                decoration: InputDecorationHelper().buildInputDecoration(
                  "Шинэ нууц үг давтах",
                ),
              ),

              Spacer(),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showTopMessage(
                        context,
                        'Таны нууц үг амжилттай солигдлоо',
                      );
                      Navigator.pop(context);
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
                      : const Text("Хадгалах", style: TextStyle(fontSize: 14)),
                ),
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  void showTopMessage(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + kToolbarHeight - 35,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.white,
          elevation: 0.1,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F6F8),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Image.asset('assets/images/notification/bell.png'),
                ),
                const SizedBox(width: 10),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF33547D),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () => overlayEntry.remove());
  }
}
