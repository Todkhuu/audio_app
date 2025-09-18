import 'package:flutter/material.dart';

class DeleteRegisterButton extends StatelessWidget {
  final VoidCallback? onTap;
  const DeleteRegisterButton({super.key, this.onTap});

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
              Image.asset('assets/images/settings/trash.png', width: 20),
              const SizedBox(width: 10),
              const Text(
                'Бүртгэл устгах',
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
