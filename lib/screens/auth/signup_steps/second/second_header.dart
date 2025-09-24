import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class SecondHeader extends StatelessWidget {
  const SecondHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledBodyText('Facebook хаягаа баталгаажуулна уу'),
        SizedBox(height: 25),
        SizedBox(
          width: 300,
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.black),
              children: [
                const TextSpan(
                  text: 'Доорх түлхүүр үгийг хуулж ',
                  style: TextStyle(
                    color: Color(0xFF33547D), // 🎨 энд өнгийг өөрчилнө
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: 'Көүч, багш Жаргаа',
                  style: TextStyle(
                    color: Color(0xFF33547D), // 🎨 энд өнгийг өөрчилнө
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                const TextSpan(
                  text:
                      ' хуудасруу чатаар явуулж Facebook хаягаа баталгаажуулна уу',
                  style: TextStyle(
                    color: Color(0xFF33547D), // 🎨 энд өнгийг өөрчилнө
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
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
