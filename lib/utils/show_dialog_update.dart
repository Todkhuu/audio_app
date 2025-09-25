import 'package:flutter/material.dart';

class ShowDialogUpdate extends StatelessWidget {
  const ShowDialogUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color(0xFFf5f6f7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: EdgeInsets.zero,
              content: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: 335,
                  height: 416,
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 60),
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(
                                'assets/images/jargaalogo.png',
                              ),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: 198,
                              child: Text(
                                'Та апп-даа шинэчлэл хийн илүү хялбаршуулсан функцуудыг ашиглаарай',
                                style: TextStyle(color: Color(0xFF33547D)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 80),
                            SizedBox(
                              width: 290,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF33547D),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text('Шинэчилэл хийх'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset(
                          'assets/images/update_dialog/topflower.png',
                          width: 100,
                        ),
                      ),
                      Positioned(
                        bottom: 75,
                        right: 0,
                        child: Image.asset(
                          'assets/images/update_dialog/rightflower.png',
                          width: 60,
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
      child: Text('update dialog'),
    );
  }
}
