import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
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
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
