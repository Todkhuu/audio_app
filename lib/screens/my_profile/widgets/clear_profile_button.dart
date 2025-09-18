import 'package:flutter/material.dart';

class ClearProfileButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ClearProfileButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.7, vertical: 13.7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/profile/recycle.png', width: 18.5),
              const SizedBox(width: 10),
              const Text(
                'Мэдээлэл цэвэрлэх',
                style: TextStyle(
                  color: Color(0xFFE8553E),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
