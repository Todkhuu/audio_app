import 'package:audio_app_2/models/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback? onTap;

  const NotificationCard({super.key, required this.item, this.onTap});

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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: item.imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.imageUrl!,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.notifications, color: Colors.blue, size: 32),
        title: Text(
          item.title,
          style: TextStyle(
            fontWeight: item.isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(item.description),
        trailing: Text(
          _formatTime(item.date),
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
