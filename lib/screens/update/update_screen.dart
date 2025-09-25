import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 294),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('assets/images/jargaalogo.png'),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 307,
                    child: Text(
                      'Та апп-даа шинэчлэл хийн илүү хялбаршуулсан функцуудыг ашиглаарай',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF33547D)),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 305,
                    height: 50,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF33547D),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15),
                        ),
                      ),
                      child: Text('Шинэчилэл хийх'),
                    ),
                  ),
                  const SizedBox(height: 35),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/update/flower.png', width: 280),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/update/flower1.png', width: 190),
          ),
          Positioned(
            bottom: 136,
            left: 0,
            child: Image.asset(
              'assets/images/update/flower_left.png',
              width: 100,
            ),
          ),
          Positioned(
            top: 166,
            right: 0,
            child: Image.asset(
              'assets/images/update/flower_right.png',
              width: 90,
            ),
          ),
        ],
      ),
    );
  }
}
