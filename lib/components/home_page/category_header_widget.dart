// widgets/category_header_widget.dart
import 'package:flutter/material.dart';

class CategoryHeaderWidget extends StatelessWidget {
  const CategoryHeaderWidget({
    super.key,
    required this.categoryName,
    required this.lessonCount,
    required this.onSeeAllPressed,
  });

  final String categoryName;
  final int lessonCount;
  final VoidCallback onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              categoryName,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF33547D),
                height: 27 / 14,
              ),
            ),
            Text(
              ' ($lessonCount)',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA9B0BB),
                height: 27 / 14,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: onSeeAllPressed,
          icon: Image.asset('assets/images/rightarrow.png', width: 12),
        ),
      ],
    );
  }
}
