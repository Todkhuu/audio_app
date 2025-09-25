import 'package:audio_app_2/screens/recommended_course/widgets/tag_text.dart';
import 'package:flutter/material.dart';

class RecommendedHeader extends StatelessWidget {
  const RecommendedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 329,
            padding: const EdgeInsets.only(
              left: 20,
              top: 90,
              right: 20,
              bottom: 20,
            ),
            color: Color(0xFF33547D),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/auth/star.png', width: 35),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 214,
                      child: Text(
                        'Таны хариултын дагуу санал болгож буй хичээл',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Танд амар тайван унтахад туслах, стресс бууруулах, тайвшрал мэдрүүлэх хичээлүүдийг санал болгож байна.',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      TagText(text: '#Унтахад туслах'),
                      TagText(text: '#Стресс бууруулах'),
                      TagText(text: '#Тайвшрал мэдрүүлэх'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/images/auth/flower.png', width: 90),
          ),
        ],
      ),
    );
  }
}
