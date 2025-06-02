import 'package:flutter/material.dart';
import 'package:lms/app/features/notifications/controller/notification_controller.dart';
import 'package:lms/app/features/notifications/model/notification_item_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
    required this.showActions,
  });

  final NotificationItemModel notification;

  final bool showActions;

  Icon _getIcon(NotificationType type) {
    switch (type) {
      case NotificationType.due:
        return Icon(Icons.schedule, color: Colors.amber);
      case NotificationType.overdue:
        return Icon(Icons.schedule, color: Colors.red);
      case NotificationType.ready:
        return Icon(Icons.check_circle, color: Colors.green);
      default:
        return Icon(Icons.notifications, color: Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = NotificationController.instance;
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        side:
            notification.read
                ? BorderSide.none
                : BorderSide(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getIcon(notification.type),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                notification.read
                                    ? Colors.grey[700]
                                    : Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        notification.date,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    notification.message,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  if (showActions)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (!notification.read)
                          TextButton(
                            onPressed:
                                () => controller.markAsRead(notification.id),
                            child: Text(
                              "Mark as read",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        TextButton(
                          onPressed:
                              () => controller.deleteNotification(
                                notification.id,
                              ),
                          child: Text(
                            "Delete",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
