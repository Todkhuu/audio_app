import 'package:intl/intl.dart';

class NotificationItem {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String? imageUrl;
  final bool isRead;
  final String? meetUrl;

  NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
    this.isRead = false,
    this.meetUrl,
  });

  /// formatted date
  String get formattedDate {
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  NotificationItem copyWith({bool? isRead}) {
    return NotificationItem(
      id: id,
      title: title,
      description: description,
      date: date,
      meetUrl: meetUrl,
      imageUrl: imageUrl,
      isRead: isRead ?? this.isRead,
    );
  }
}
