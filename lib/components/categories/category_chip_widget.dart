// widgets/category_chip_widget.dart
import 'package:flutter/material.dart';

class CategoryChipWidget extends StatelessWidget {
  const CategoryChipWidget({
    super.key,
    required this.categoryName,
    required this.isSelected,
    required this.lessonCount,
    required this.onTap,
  });

  final String categoryName;
  final bool isSelected;
  final int lessonCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? const Color(0xFF33547D) : Colors.white,
          border: isSelected
              ? Border.all(color: const Color(0xFF33547D))
              : Border.all(width: 0, color: Colors.transparent),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$categoryName ($lessonCount)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF33547D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
