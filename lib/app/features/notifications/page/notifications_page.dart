import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/custom_app_bar.dart';
import 'package:lms/app/features/notifications/controller/notification_controller.dart';
import 'package:lms/app/features/notifications/model/notification_item_model.dart';

import 'widgets/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = NotificationController.instance;

    return DefaultTabController(
      length: 2,
      child: Obx(() {
        final all = controller.notifications;
        final unread = all.where((n) => !n.read).toList();

        return Scaffold(
          appBar: CustomAppBar(
            title: 'Notifications',
            showBackButton: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.mark_email_read),
                onPressed:
                    controller.unreadCount == 0
                        ? null
                        : controller.markAllAsRead,
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed:
                    controller.notifications.any((n) => n.read)
                        ? controller.deleteAllRead
                        : null,
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: TabBar(
                tabs: [
                  Tab(text: "All (${all.length})"),
                  Tab(text: "Unread (${unread.length})"),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              _buildNotificationList(all),
              _buildNotificationList(unread, isUnread: true),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildNotificationList(
    List<NotificationItemModel> notifications, {
    bool isUnread = false,
  }) {
    if (notifications.isEmpty) {
      return _emptyState(
        isUnread ? "No unread notifications" : "No notifications",
        Icons.notifications,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: notifications.length,
      itemBuilder: (_, i) {
        return NotificationCard(
          notification: notifications[i],
          showActions: true,
        );
      },
    );
  }

  Widget _emptyState(String text, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: Colors.grey[300]),
          const SizedBox(height: 8),
          Text(text, style: TextStyle(color: Colors.grey[600])),
          const Text(
            "You're all caught up!",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
