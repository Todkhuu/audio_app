// widgets/lesson_image_widget.dart
import 'package:flutter/material.dart';

class LessonImageWidget extends StatelessWidget {
  const LessonImageWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
    );
  }
}
