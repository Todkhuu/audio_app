import 'package:flutter/material.dart';

class CompletedButton extends StatelessWidget {
  const CompletedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(
          'assets/images/action_control/checkbox.png',
          width: 26,
          height: 26,
        ),
      ),
    );
  }
}
