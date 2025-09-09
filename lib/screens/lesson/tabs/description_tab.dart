import 'package:audio_app_2/screens/lesson/widgets/buy_button.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/payment/payment_screen.dart';
import 'package:flutter/material.dart';

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({super.key, required this.lesson});
  final AudioLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 14),
          child: Text(
            'Хөтөлбөрийн тайлбар',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 27 / 14,
              color: Color(0xFF33547D),
            ),
          ),
        ),
        Text(
          'Энэ хичээлээр та хүндэрсэн өвчтэй хүмүүс ямар аргаар эмчлэгдэж, өвчнийхөө гүн сэтгэлзүйн шалтгааныг хэрхэн олсныг сонсоно. Ингэснээр бидний дотор хадгалагдсан гүн гүнзгий гомдол, шийдээгүй сэтгэл санааны дарамт нь бие махбодид хэрхэн хорт нөлөө үзүүлж, өвчин болон сөрөг үр дагавар үүсгэдгийг ойлгож мэдрэх болно. Хүн уур, гомдлоо удаан хадгалбал дархлаа сулрах, эрч хүч буурах, улмаар бие махбодын янз бүрийн эмгэгийн шалтгаан болж байгааг та ойлгож авна.',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 19 / 14,
            color: Color(0xFF3F444D),
          ),
          textAlign: TextAlign.justify,
        ),
        Expanded(child: SizedBox()),
        BuyButton(
          price: lesson.price,
          text: 'Худалдаж авах',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentScreen(lesson: lesson),
              ),
            );
          },
        ),
      ],
    );
  }
}
