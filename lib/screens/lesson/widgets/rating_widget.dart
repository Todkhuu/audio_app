import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rate;
  const RatingWidget({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/bg/star.png', width: 12),
          const SizedBox(width: 2),
          Text(
            rate.toString(),
            style: const TextStyle(
              color: Color(0xFFF5B945),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
