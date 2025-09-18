import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/managers/auth_manager.dart';
import 'package:audio_app_2/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FixProfileScreen extends StatefulWidget {
  final User user;
  const FixProfileScreen({super.key, required this.user});

  @override
  State<FixProfileScreen> createState() => _FixProfileScreenState();
}

class _FixProfileScreenState extends State<FixProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _birthController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name ?? '');
    _birthController = TextEditingController(
      text: widget.user.birthDate != null
          ? "${widget.user.birthDate!.year}-${widget.user.birthDate!.month.toString().padLeft(2, '0')}-${widget.user.birthDate!.day.toString().padLeft(2, '0')}"
          : '',
    );
    _emailController = TextEditingController(text: widget.user.email ?? '');
    _phoneController = TextEditingController(text: widget.user.phones ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveProfile(AuthManager authManager) {
    if (_formKey.currentState!.validate()) {
      // Жишээ: authManager.updateUser(...) гэх мэтээр хадгалах логик
      print('Name: ${_nameController.text}');
      print('Birth: ${_birthController.text}');
      print('Email: ${_emailController.text}');
      print('Phone: ${_phoneController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authManager = context.watch<AuthManager>();
    return Scaffold(
      appBar: ScreensHeader(text: 'Бүртгэл засах'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20,
          top: 16,
          right: 20,
          bottom: 35,
        ),
        child: Form(
          key: _formKey,
          child: IntrinsicHeight(
            child: Column(
              children: [
                _buildTextField(
                  controller: _nameController,
                  label: 'Хэрэглэгчийн нэр',
                  validator: (value) => value == null || value.isEmpty
                      ? 'Нэр хоосон байна'
                      : null,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _birthController,
                  label: 'Төрсөн өдөр',
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Төрсөн өдөр хоосон байна';
                    try {
                      DateTime.parse(value);
                    } catch (_) {
                      return 'Төрсөн өдөр буруу байна';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _emailController,
                  label: 'Цахим хаяг',
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Цахим хаяг хоосон байна';
                    final emailRegex = RegExp(
                      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                    );
                    if (!emailRegex.hasMatch(value))
                      return 'Цахим хаяг буруу байна';
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _phoneController,
                  label: 'Утасны дугаар',
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Утас хоосон байна';
                    if (!RegExp(r"^\+?\d{8,15}$").hasMatch(value))
                      return 'Утас буруу байна';
                    return null;
                  },
                ),
                Spacer(),
                const SizedBox(height: 380),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: authManager.isLoading
                        ? null
                        : () => _saveProfile(authManager),
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
                            'Хадгалах',
                            style: TextStyle(fontSize: 14),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xFF33547D),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xFFA9B0BB),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.only(left: 15, top: 16, bottom: 16),
      ),
      validator: validator,
    );
  }
}
