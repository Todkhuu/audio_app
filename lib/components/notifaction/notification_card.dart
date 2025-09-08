import 'package:audio_app_2/models/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({super.key, required this.item});

  String _formatTime(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 60) return "${diff.inMinutes} минутын өмнө";
    if (diff.inHours < 24) return "${diff.inHours} цагийн өмнө";
    return "${diff.inDays} хоногийн өмнө";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {},
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/notification/notiflogo.png',
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF33547D),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              item.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 16 / 14,
                color: Color(0xFFA9B0BB),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              _formatTime(item.date),
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF33547D),
                height: 14 / 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        trailing: Text(''),
      ),
    );
  }
}
