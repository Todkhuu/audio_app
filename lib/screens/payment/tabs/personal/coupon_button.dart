import 'package:flutter/material.dart';

class CouponButton extends StatefulWidget {
  const CouponButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  State<CouponButton> createState() => _CouponButtonState();
}

class _CouponButtonState extends State<CouponButton> {
  final TextEditingController _couponController = TextEditingController();
  bool _hasInput = false;

  @override
  void initState() {
    super.initState();
    _couponController.addListener(() {
      setState(() {
        _hasInput = _couponController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6F8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _couponController,
                decoration: const InputDecoration(
                  hintText: 'Купон код оруулах',
                  hintStyle: TextStyle(color: Color(0xFFCAD0D7), fontSize: 12),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 30,
            child: ElevatedButton(
              onPressed: _hasInput
                  ? () {
                      if (widget.onPressed != null) {
                        widget.onPressed!();
                      }
                      debugPrint('Coupon: ${_couponController.text}');
                    }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((
                  states,
                ) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white;
                  }
                  return const Color(0xFF33547D);
                }),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Text(
                'Ашиглах',
                style: TextStyle(
                  color: _hasInput ? Colors.white : Color(0xFFCAD0D7),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
