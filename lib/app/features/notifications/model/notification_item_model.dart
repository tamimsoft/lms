enum NotificationType { info, due, overdue, ready }

class NotificationItemModel {
  final String id;
  final String title;
  final String message;
  final String date;
  bool read;
  final NotificationType type;

  NotificationItemModel({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.read,
    required this.type,
  });
}
