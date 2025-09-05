import 'package:audio_app_2/components/home_page/notification_card.dart';
import 'package:audio_app_2/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final NotificationService _notificationService = NotificationService();
  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f5f7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
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
                      'assets/images/left.png',
                      width: 45,
                      height: 45,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Мэдэгдэл',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        height: 27 / 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _notificationService.notifications,
        builder: (context, notifications, _) {
          if (notifications.isEmpty) {
            return const Center(child: Text("Мэдэгдэл алга"));
          }

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final item = notifications[index];
              return Container(
                margin: EdgeInsets.only(top: 15),
                child: NotificationCard(item: item),
              );
            },
          );
        },
      ),
    );
  }
}
