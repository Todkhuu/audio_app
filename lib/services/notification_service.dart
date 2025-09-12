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
        title: "Амьдралын туршлага уулзалт эхэллээ",
        description:
            "Энэ уулзалт нь хүндэрсэн өвчтэй хүмүүс яаж эмчилж, өвчний сэтгэл зүйн учир шалтгааныг олсоныг нь сонсоод та гүн гүнзгий гомдол таны биед ямар уршигтай, муу үр дагавартай гэдгийг мэдэрнэ.",
        date: DateTime.now().subtract(const Duration(minutes: 10)),
        meetUrl: 'https://zoom.us/j/123456789',
      ),
      NotificationItem(
        id: "2",
        title: "Тайвшрах бясалгал хичээл орлоо",
        description: "Тайвшрах бясалгал хичээл татаж авах боломжтойгоор орлоо",
        date: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      NotificationItem(
        id: "3",
        title: "Эдгэрийн дасгалжуулалт хичээл 30 хувь хямдарлаа",
        description:
            "Эдгэрлийн дасгалжуулалт хичээл 30 хувь хямдарлаа. Тус хямдрал ердөө 30 хоногийн хугацаатай үргэлжилнэ",
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  void markAsRead(String id) {
    notifications.value = notifications.value
        .map((n) => n.id == id ? n.copyWith(isRead: true) : n)
        .toList();
  }
}
