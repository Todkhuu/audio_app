import 'package:audio_app_2/screens/notifaction/widgets/notification_card.dart';
import 'package:audio_app_2/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationService _notificationService = NotificationService();
  NotificationScreen({super.key});

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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'assets/images/left.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Мэдэгдэл',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 18.54 / 16,
                      color: Color(0xFF33547D),
                    ),
                  ),
                ],
              ),
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
