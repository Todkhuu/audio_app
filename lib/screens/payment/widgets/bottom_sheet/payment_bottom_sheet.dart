import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/payment/widgets/bottom_sheet/payment_title.dart';
import 'package:audio_app_2/screens/payment/widgets/show_dialog/payment_show_dialog.dart';
import 'package:audio_app_2/screens/player/widgets/lessons_bottom_sheet/sheet_handle.dart';
import 'package:flutter/material.dart';

class PaymentBottomSheet extends StatefulWidget {
  final int price;
  final String text;
  final AudioLesson lesson;
  const PaymentBottomSheet({
    super.key,
    required this.price,
    required this.text,
    required this.lesson,
  });

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> options = [
      {'img': 'assets/images/payment/khan.png', 'text': 'Хаан банк'},
      {'img': 'assets/images/payment/social.png', 'text': 'Social pay'},
      {'img': 'assets/images/payment/golomt.png', 'text': 'Голомт банк'},
      {'img': 'assets/images/payment/khas.png', 'text': 'Хас банк'},
      {'img': 'assets/images/payment/tdb.png', 'text': 'ХХБ'},
      {'img': 'assets/images/payment/bogd.png', 'text': 'Богд банк'},
      {'img': 'assets/images/payment/m.png', 'text': 'М Банк'},
    ];
    return FractionallySizedBox(
      heightFactor: 0.55,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 21,
              right: 20,
              bottom: 35,
            ),
            child: Column(
              children: [
                SheetHandle(),
                const SizedBox(height: 21),
                PaymentTitle(),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: options.map((option) {
                      bool isSelected = _selectedOption == option['text'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOption = option['text'];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F6F8),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? Color(0xFF33547D)
                                  : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(option['img']!, width: 30),
                              const SizedBox(width: 10),
                              Text(
                                option['text']!,
                                style: TextStyle(
                                  color: isSelected
                                      ? Color(0xFF33547D)
                                      : Color(0xFFA9B0BB),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 40),
                PaymentShowDialog(
                  price: widget.price,
                  text: widget.text,
                  lesson: widget.lesson,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close, color: Color(0xFFA9B0BB), size: 16),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
