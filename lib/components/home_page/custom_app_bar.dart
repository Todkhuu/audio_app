import 'package:audio_app_2/components/home_page/notification_page.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 40),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/jargaalogo.png',
                    width: 45,
                    height: 45,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Jargaa',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      height: 25 / 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xFFF9F4F2),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
                  icon: Image.asset(
                    'assets/images/notifs.png',
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
