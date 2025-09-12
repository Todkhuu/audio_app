import 'package:audio_app_2/models/notification_item.dart';
import 'package:audio_app_2/screens/notifaction/widgets/notification_bottom_sheet.dart';
import 'package:audio_app_2/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final NotificationService notificationService;

  const NotificationCard({
    super.key,
    required this.item,
    required this.notificationService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {
          // Bottom sheet show
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => NotificationBottomSheet(item: item),
          );
          // Mark as read
          if (!item.isRead) {
            notificationService.markAsRead(item.id);
          }
        },
        leading: Container(
          width: 45,
          height: 45,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFF4F6F8),
            borderRadius: BorderRadius.circular(35),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/notification/bell.png',
              fit: BoxFit.cover,
              color: item.isRead ? Color(0xFFCAD0D7) : null,
            ),
          ),
        ),
        title: Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF33547D),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              item.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFFA9B0BB),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              item.formattedDate,
              style: TextStyle(fontSize: 12, color: Color(0xFF33547D)),
            ),
          ],
        ),
        trailing: Image.asset(
          'assets/images/rightarrow.png',
          width: 12,
          color: item.isRead ? Color(0xFFCAD0D7) : Color(0xFF33547D),
        ),
      ),
    );
  }
}
