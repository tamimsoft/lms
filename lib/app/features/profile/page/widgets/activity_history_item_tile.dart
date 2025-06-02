import 'package:flutter/material.dart';
import 'package:lms/app/features/profile/model/activity_history_item.dart';

class ActivityHistoryItemTile extends StatelessWidget {
  const ActivityHistoryItemTile({
    super.key,
    required this.item,
    this.showDivider = true,
  });

  final ActivityHistoryItem item;
  final bool showDivider;

  Icon _getItemIcon(ActivityType type) {
    switch (type) {
      case ActivityType.borrowing:
        return Icon(Icons.menu_book_outlined, color: Colors.blue, size: 18);
      case ActivityType.returned:
        return Icon(Icons.access_time, color: Colors.green, size: 18);
      case ActivityType.favorite:
        return Icon(Icons.favorite, color: Colors.red, size: 18);
      case ActivityType.review:
        return Icon(Icons.calendar_today, color: Colors.amber, size: 18);
      default:
        return Icon(Icons.info, size: 18);
    }
  }

  String _getItemTitle(ActivityType type) {
    switch (type) {
      case ActivityType.borrowing:
        return 'Borrowed';
      case ActivityType.returned:
        return 'Returned';
      case ActivityType.favorite:
        return 'Added to favorites';
      case ActivityType.review:
        return 'Left a review';
      default:
        return 'Activity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                leading: _getItemIcon(item.type),
                title: Text(_getItemTitle(item.type)),
                subtitle: Text(item.bookTitle),
                //onTap: () => Get.toNamed('/book/${item.bookId}'),
              ),
            ),
            Expanded(
              child: Text(
                '${item.date.month}/${item.date.day}/${item.date.year}',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                item.details ?? '',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
        if (showDivider) const Divider(height: 1),
      ],
    );
  }
}
