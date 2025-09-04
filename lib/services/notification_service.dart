import 'package:flutter/material.dart';
import '../models/notification_item.dart';

class NotificationService {
  final ValueNotifier<List<NotificationItem>> notifications =
      ValueNotifier<List<NotificationItem>>([]);

  NotificationService() {
    loadMockNotifications();
  }

  void loadMockNotifications() {
    notifications.value = [
      NotificationItem(
        id: "1",
        title: "Шинэ хичээл нэмэгдлээ",
        description: "Танд зориулсан шинэ аудио хичээл нэмэгдлээ!",
        date: DateTime.now().subtract(const Duration(minutes: 10)),
        imageUrl: null,
      ),
      NotificationItem(
        id: "2",
        title: "Update гарлаа",
        description: "Шинэ хувилбар татаж авах боломжтой боллоо.",
        date: DateTime.now().subtract(const Duration(hours: 3)),
        imageUrl: null,
      ),
      NotificationItem(
        id: "3",
        title: "Сануулах",
        description: "Өнөөдрийн дасгал хийж амжаарай!",
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  void addNotification(NotificationItem item) {
    final currentList = List<NotificationItem>.from(notifications.value);
    currentList.insert(0, item);
    notifications.value = currentList;
  }

  void markAsRead(String id) {
    final updated = notifications.value.map((n) {
      if (n.id == id) {
        return NotificationItem(
          id: n.id,
          title: n.title,
          description: n.description,
          date: n.date,
          imageUrl: n.imageUrl,
          isRead: true,
        );
      }
      return n;
    }).toList();
    notifications.value = updated;
  }

  void clearAll() {
    notifications.value = [];
  }
}
