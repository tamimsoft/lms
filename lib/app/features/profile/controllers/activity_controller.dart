import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/profile/model/activity_history_item.dart';

class ActivityHistoryController extends GetxController {
  static ActivityHistoryController get instance =>
      Get.find<ActivityHistoryController>();
  late TabController tabController;
  final RxInt tab = 0.obs;
  final RxString activeTab = 'all'.obs;

  final List<ActivityHistoryItem> activities = [
    ActivityHistoryItem(
      id: '1',
      type: ActivityType.borrowing,
      date: DateTime(2025, 5, 15),
      bookTitle: 'To Kill a Mockingbird',
      bookId: 'book1',
      details: 'Due on June 5, 2025',
    ),
    ActivityHistoryItem(
      id: '2',
      type: ActivityType.returned,
      date: DateTime(2025, 5, 10),
      bookTitle: '1984',
      bookId: 'book2',
    ),
    ActivityHistoryItem(
      id: '3',
      type: ActivityType.favorite,
      date: DateTime(2025, 5, 8),
      bookTitle: 'The Great Gatsby',
      bookId: 'book3',
    ),
    ActivityHistoryItem(
      id: '4',
      type: ActivityType.review,
      date: DateTime(2025, 5, 5),
      bookTitle: 'Pride and Prejudice',
      bookId: 'book4',
      details: 'Rated 5 stars',
    ),
    ActivityHistoryItem(
      id: '5',
      type: ActivityType.borrowing,
      date: DateTime(2025, 4, 28),
      bookTitle: 'Lord of the Flies',
      bookId: 'book5',
      details: 'Due on May 19, 2025',
    ),
  ];

  List<ActivityHistoryItem> filteredActivities({ActivityType? type}) {
    if (type == null) return activities;
    return activities.where((b) => b.type == type).toList();
  }
}
