class NotificationItem {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String? imageUrl;
  final bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
    this.isRead = false,
  });
}
