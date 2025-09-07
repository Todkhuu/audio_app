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
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/jargaalogo.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Jargaa',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 18.54 / 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  IconButton(
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
                      width: 20,
                      height: 20,
                      color: Color(0xFFCAD0D7),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 2,
                    child: Container(
                      width: 23,
                      height: 19,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        color: Color(0xFFE8553E),
                      ),
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
