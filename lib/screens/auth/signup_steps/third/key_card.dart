import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class KeyCard extends StatelessWidget {
  final String green;
  final String green1;
  final String green2;
  final String imageUrl;
  final String cardHeader;
  final String cardText;
  final String buttonText;
  const KeyCard({
    super.key,
    required this.green,
    required this.green1,
    required this.green2,
    required this.imageUrl,
    required this.cardHeader,
    required this.cardText,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 14, color: Colors.black),
            children: [
              TextSpan(
                text: green,
                style: TextStyle(
                  color: Color(0xFF188C7E),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: green1,
                style: TextStyle(
                  color: Color(0xFF188C7E),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: green2,
                style: TextStyle(
                  color: Color(0xFF188C7E),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 11),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Image.asset(imageUrl, width: 35),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledThinGreyText(cardHeader),
                    Text(
                      cardText,
                      style: TextStyle(
                        color: Color(0xFF33547D),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color(0xFFF4F6F8),
                  foregroundColor: Color(0xFF33547D),
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
