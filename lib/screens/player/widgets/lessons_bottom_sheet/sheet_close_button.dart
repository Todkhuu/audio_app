import 'package:flutter/material.dart';

class SheetCloseButton extends StatelessWidget {
  const SheetCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close, size: 16, color: Color(0xFFA9B0BB)),
      onPressed: () => Navigator.pop(context),
    );
  }
}
