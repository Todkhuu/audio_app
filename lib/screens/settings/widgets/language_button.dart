import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const LanguageButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
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
          TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Color(0xFF89C053),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(width: 9),
                Image.asset('assets/images/settings/flag.png', width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
