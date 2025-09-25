import 'package:flutter/material.dart';

class PaymentTitle extends StatelessWidget {
  const PaymentTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: const Text(
        "Төлбөрийн хэрэгсэл сонгох",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF33547D),
        ),
      ),
    );
  }
}
