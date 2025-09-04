import 'package:audio_app_2/components/home_page/notification_card.dart';
import 'package:audio_app_2/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final NotificationService _notificationService = NotificationService();
  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              child: Image.asset(
                'assets/images/left.png',
                width: 45,
                height: 45,
              ),
            ),
          ),
        ),
        title: const Text(
          'Мэдэгдэл',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            height: 27 / 16,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black, // text & icon хар өнгөтэй
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
              return NotificationCard(
                item: item,
                onTap: () {
                  _notificationService.markAsRead(item.id); // ✅ зөв дуудах
                },
              );
            },
          );
        },
      ),
    );
  }
}
