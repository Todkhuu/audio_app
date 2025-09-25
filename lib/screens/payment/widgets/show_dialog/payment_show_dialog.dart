import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/payment/widgets/price_tag.dart';
import 'package:audio_app_2/screens/payment_success/payment_success_screen.dart';
import 'package:flutter/material.dart';

class PaymentShowDialog extends StatelessWidget {
  final String text;
  final int price;
  final AudioLesson lesson;
  const PaymentShowDialog({
    super.key,
    required this.price,
    required this.text,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    Color borderColor = Colors.grey.shade200;

                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentSuccessScreen(lesson: lesson),
                        ),
                      );
                    });

                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.zero,
                      content: SizedBox(
                        width: 295,
                        height: 255,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 35),
                              AnimatedContainer(
                                duration: const Duration(seconds: 2),
                                width: 70,
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF4F6F8),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: borderColor,
                                    width: 2,
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/payment/wallet.png',
                                ),
                              ),
                              const SizedBox(height: 50),
                              SizedBox(
                                width: 137,
                                child: Text(
                                  'Төлбөр хүлээгдэж байна...',
                                  style: const TextStyle(
                                    color: Color(0xFF33547D),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF33547D),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 7,
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              PriceTag(price: price),
            ],
          ),
        ),
      ),
    );
  }
}
