import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final int price;
  const PriceTag({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF46658a),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '${price}₮',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
