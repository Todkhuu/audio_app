import 'package:audio_app_2/screens/bottom_navigation_bar/audio_app_bottom_nav.dart';
import 'package:flutter/material.dart';

class RecommendedBottomActions extends StatelessWidget {
  const RecommendedBottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: Image.asset('assets/images/leftarrow.png', width: 12),
            ),
          ),
          Container(
            width: 180,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF33547D),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AudioAppBottomNav()),
                );
              },
              child: Text(
                'Бусад хичээл үзэх',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
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
