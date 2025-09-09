import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  final int price;

  final String text;

  const PayButton({super.key, required this.price, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => FractionallySizedBox(
                heightFactor: 0.5,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 19.0),
                          child: Container(
                            width: 55,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Color(0xFFCAD0D7),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 10,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Төлбөрийн хэрэгсэл сонгох",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF33547D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // X
                    Positioned(
                      top: 0,
                      right: 8,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color(0xFFA9B0BB),
                          size: 16,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF33547D),
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
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF46658a),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${price}₮',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
