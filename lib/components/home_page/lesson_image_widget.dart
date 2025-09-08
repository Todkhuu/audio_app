// widgets/lesson_image_widget.dart
import 'package:flutter/material.dart';

class LessonImageWidget extends StatelessWidget {
  const LessonImageWidget({
    super.key,
    required this.imageUrl,
    required this.rate,
  });

  final String imageUrl;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white, // эсвэл хүссэн color
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/bg/star.png', width: 10),
                const SizedBox(width: 2),
                Text(
                  rate.toString(),
                  style: const TextStyle(
                    color: Color(0xFFF5B945),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
