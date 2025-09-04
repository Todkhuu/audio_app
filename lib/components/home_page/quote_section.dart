// widgets/quote_section.dart
import 'package:flutter/material.dart';

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      color: const Color(0xFFF9F4F2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quet.png'),
          const SizedBox(height: 30),
          SizedBox(
            width: 172,
            child: const Text(
              'Сэжгээр өвдөж сүжгээр эдгэнэ.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 27 / 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
