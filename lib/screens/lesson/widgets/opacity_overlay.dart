import 'package:flutter/material.dart';

class OpacityOverlay extends StatelessWidget {
  const OpacityOverlay({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 195,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
