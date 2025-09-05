import 'package:flutter/material.dart';

class InputDecorationHelper {
  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Color(0xFFA9B0BB),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.only(left: 15, top: 23, bottom: 22),
    );
  }
}
