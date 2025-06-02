import 'package:get/get.dart';
import 'package:lms/app/features/notifications/model/notification_item_model.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();
  var notifications =
      <NotificationItemModel>[
        NotificationItemModel(
          id: '1',
          title: 'Book Return Reminder',
          message: 'Your book "The Great Gatsby" is due in 2 days.',
          date: '2025-05-20',
          read: false,
          type: NotificationType.due,
        ),
        NotificationItemModel(
          id: '2',
          title: 'Book Available',
          message:
              'The book "To Kill a Mockingbird" is now available for pickup.',
          date: '2025-05-19',
          read: false,
          type: NotificationType.ready,
        ),
        NotificationItemModel(
          id: '3',
          title: 'Overdue Book',
          message:
              'Your book "1984" is 3 days overdue. Please return it as soon as possible.',
          date: '2025-05-18',
          read: true,
          type: NotificationType.overdue,
        ),
        NotificationItemModel(
          id: '4',
          title: 'Account Update',
          message: 'Your account information has been successfully updated.',
          date: '2025-05-15',
          read: true,
          type: NotificationType.info,
        ),
      ].obs;

  void markAsRead(String id) {
    final index = notifications.indexWhere((n) => n.id == id);
    if (index != -1) notifications[index].read = true;
    notifications.refresh();
  }

  void deleteNotification(String id) {
    notifications.removeWhere((n) => n.id == id);
  }

  void markAllAsRead() {
    for (var n in notifications) {
      n.read = true;
    }
    notifications.refresh();
  }

  void deleteAllRead() {
    notifications.removeWhere((n) => n.read);
  }

  int get unreadCount => notifications.where((n) => !n.read).length;
}
