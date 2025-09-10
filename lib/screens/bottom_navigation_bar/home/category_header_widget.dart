// widgets/category_header_widget.dart
import 'package:audio_app_2/shared/styled_text.dart';
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
            StyledSmallBodyText(categoryName),
            StyledThinGreyText(' ($lessonCount)'),
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
