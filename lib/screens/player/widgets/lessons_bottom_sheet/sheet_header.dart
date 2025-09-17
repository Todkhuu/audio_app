import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({
    super.key,
    required this.lessons,
    required this.pageManager,
  });

  final List lessons;
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Хичээл',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 27 / 16,
                color: Color(0xFF33547D),
              ),
            ),
            const SizedBox(width: 3),
            Text(
              '(${lessons.length})',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 27 / 16,
                color: Color(0xFFA9B0BB),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFFF4F6F8), width: 2),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/action_control/download.png',
                width: 14,
              ),
              const SizedBox(width: 7),
              const StyledSmallthinBodyText('Бүгдийг татах'),
            ],
          ),
        ),
      ],
    );
  }
}
