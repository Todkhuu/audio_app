import 'package:audio_app_2/common/dashed_divider.dart';
import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/models/ebarimt.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EBarimtDetailScreen extends StatelessWidget {
  const EBarimtDetailScreen({
    super.key,
    required this.lesson,
    required this.lessonEBarimts,
  });

  final AudioLesson lesson;
  final List<EBarimt> lessonEBarimts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensHeader(text: 'И-Баримт'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: [
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 35),
                  Center(
                    child: Image.asset(
                      'assets/images/ebarimt/ebarimt.png',
                      width: 70,
                    ),
                  ),
                  const SizedBox(height: 70),
                  // EBarimt мэдээлэл
                  ...lessonEBarimts.map((ebarimt) {
                    if (ebarimt.type == EBarimtType.individual) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Огноо',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF33547D),
                            ),
                          ),
                          Text(
                            DateFormat(
                              'yyyy-MM-dd HH:mm',
                            ).format(ebarimt.paidDate!),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF33547D),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Огноо',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF33547D),
                            ),
                          ),
                          Text(
                            DateFormat(
                              'yyyy-MM-dd HH:mm',
                            ).format(ebarimt.paidDate!),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF33547D),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    }
                  }),

                  const SizedBox(height: 18),
                  DashedDivider(),
                  const SizedBox(height: 18),

                  // Lesson price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Төлсөн дүн',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF33547D),
                        ),
                      ),
                      Text(
                        '${lesson.price}₮',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF33547D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),
                  DashedDivider(),
                  const SizedBox(height: 18),

                  ...lessonEBarimts.map((ebarimt) {
                    if (ebarimt.type == EBarimtType.individual) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Сугалааны дугаар',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF33547D),
                                ),
                              ),
                              Text(
                                ebarimt.receiptNumber.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF33547D),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 50),

                          Image.asset(ebarimt.qrImage!, width: 99),

                          const SizedBox(height: 35),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Регистрийн дугаар',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF33547D),
                                ),
                              ),
                              Text(
                                ebarimt.registrationNumber.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF33547D),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),
                          DashedDivider(),
                          const SizedBox(height: 18),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Байгууллагын нэр',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF33547D),
                                ),
                              ),
                              Text(
                                ebarimt.organizationName!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF33547D),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 35),
                        ],
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
