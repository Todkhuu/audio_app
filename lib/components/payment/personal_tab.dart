import 'package:audio_app_2/components/payment/pay_button.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class PersonalTab extends StatelessWidget {
  const PersonalTab({super.key, required this.lesson});
  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Хичээл',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF33547D),
                        ),
                      ),
                      Text(
                        lesson.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 15 / 14,
                          fontSize: 12,
                          color: Color(0xFF33547D),
                        ),
                      ),
                    ],
                  ),
                ),

                LayoutBuilder(
                  builder: (context, constraints) {
                    return Dash(
                      direction: Axis.horizontal,
                      length: constraints.maxWidth,
                      dashLength: 4.5,
                      dashThickness: 0.25,
                      dashColor: Color(0xFF33547D),
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Төлөх дүн',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF33547D),
                        ),
                      ),
                      Text(
                        '${lesson.price}₮',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 15 / 14,
                          fontSize: 12,
                          color: Color(0xFF33547D),
                        ),
                      ),
                    ],
                  ),
                ),

                LayoutBuilder(
                  builder: (context, constraints) {
                    return Dash(
                      direction: Axis.horizontal,
                      length: constraints.maxWidth,
                      dashLength: 4.5,
                      dashThickness: 0.25,
                      dashColor: Color(0xFF33547D),
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'НӨАТ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF33547D),
                        ),
                      ),
                      Text(
                        'Хувь хүн',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 15 / 14,
                          fontSize: 12,
                          color: Color(0xFF33547D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 15),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFFCAD0D7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Купон код оруулах'),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F6F8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Text('Ашиглах'),
                  ),
                ],
              ),
            ),
          ),

          Expanded(child: SizedBox()),

          PayButton(price: lesson.price, text: 'Төлбөр төлөх'),
        ],
      ),
    );
  }
}
