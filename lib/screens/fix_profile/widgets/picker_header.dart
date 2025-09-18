import 'package:flutter/material.dart';

class PickerHeader extends StatelessWidget {
  const PickerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 55,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFCAD0D7),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.close,
                size: 16,
                color: Color(0xFFA9B0BB),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
