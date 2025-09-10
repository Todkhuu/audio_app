import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class CouponButton extends StatelessWidget {
  const CouponButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 15),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFFCAD0D7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StyledThinGreyText('Купон код оруулах'),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6F8),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: StyledThinGreyText('Ашиглах'),
            ),
          ],
        ),
      ),
    );
  }
}
