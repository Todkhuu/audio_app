import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ProfileWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF33547D),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Image.asset(
              'assets/images/rightarrow.png',
              width: 12,
              height: 12,
            ),
          ),
        ],
      ),
    );
  }
}
