import 'package:flutter/material.dart';
import 'package:audio_app_2/utils/validators.dart';

class ForgetThird extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const ForgetThird({super.key, required this.formKey});

  @override
  ForgetThirdState createState() => ForgetThirdState();
}

class ForgetThirdState extends State<ForgetThird> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 63),
        Text(
          'Шинэ нууц үг оруулах',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF33547D),
          ),
        ),
        SizedBox(height: 25),
        Text(
          'Цаашид нэвтэрч орохдоо ашиглах нууц үгээ оруулна уу',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFF33547D),
            height: 17 / 14,
          ),
        ),
        SizedBox(height: 26),
        Form(
          key: widget.formKey,
          child: Column(
            children: [
              // Шинэ нууц үг
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Шинэ нууц үг',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFA9B0BB),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(
                    left: 15,
                    top: 16,
                    bottom: 16,
                  ),
                  suffixIconColor: Color(0xFF33547D),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                validator: (value) {
                  return Validators.validatePassword(value);
                },
              ),

              SizedBox(height: 16),
              // Шинэ нууц үг давтах
              TextFormField(
                controller: _confirmController,
                decoration: InputDecoration(
                  labelText: 'Шинэ нууц үг давтах',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFA9B0BB),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(
                    left: 15,
                    top: 16,
                    bottom: 16,
                  ),
                  suffixIconColor: Color(0xFF33547D),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirm ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirm = !_obscureConfirm;
                      });
                    },
                  ),
                ),
                obscureText: _obscureConfirm,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Нууц үг давтах хоосон байна';
                  }
                  if (value != _passwordController.text) {
                    return 'Нууц үг таарахгүй байна';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
