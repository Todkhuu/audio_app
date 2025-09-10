import 'package:flutter/material.dart';

class LessonImage extends StatelessWidget {
  const LessonImage({super.key, required this.image, required this.rate});

  final String image;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            width: 118.7,
            height: 118.7,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white,
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
