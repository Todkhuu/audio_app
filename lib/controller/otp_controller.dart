import 'package:flutter/material.dart';

class OtpController {
  final int length;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  OtpController({this.length = 4}) {
    controllers = List.generate(length, (_) => TextEditingController());
    focusNodes = List.generate(length, (_) => FocusNode());
  }

  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
  }

  void onChanged(String value, int index, void Function(String) onCompleted) {
    if (value.length == 1 && index < length - 1) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    String otp = controllers.map((c) => c.text).join();
    if (otp.length == length) {
      onCompleted(otp);
    }
  }
}
