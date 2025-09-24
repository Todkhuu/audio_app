import 'package:audio_app_2/screens/start_step/start_step.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset('assets/images/signup/bg.png'),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 45, right: 32),
                child: Column(
                  children: [
                    Text(
                      'Таны бие сэтгэлийн эдгэрэлд туслах зорилгоор танд тохирсон хичээл санал болгохын тулд хэдэн асуулга асууя',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF33547D),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    StyledBodyText('Таны эдгэрэл эндээс эхэлнэ'),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 35,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StartStep()),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(180, 50),
                backgroundColor: Color(0xFF33547D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Эхлүүлэх',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
