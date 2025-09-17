import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/screens/notifaction/widgets/notification_card.dart';
import 'package:audio_app_2/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationService _notificationService = NotificationService();
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f5f7),
      appBar: ScreensHeader(text: 'Мэдэгдэл'),
      body: ValueListenableBuilder(
        valueListenable: _notificationService.notifications,
        builder: (context, notifications, _) {
          if (notifications.isEmpty)
            return const Center(child: Text("Мэдэгдэл алга"));
          return ListView.builder(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final item = notifications[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: NotificationCard(
                  item: item,
                  notificationService: _notificationService,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
