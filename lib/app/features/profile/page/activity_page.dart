import 'package:flutter/material.dart';
import 'package:lms/app/common/widget/custom_app_bar.dart';
import 'package:lms/app/features/profile/controllers/activity_controller.dart';
import 'package:lms/app/features/profile/model/activity_history_item.dart';

import 'widgets/activity_history_item_tile.dart';

class ActivityHistoryPage extends StatelessWidget {
  final ActivityHistoryController controller =
      ActivityHistoryController.instance;

  ActivityHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Activity History',
          showBackButton: true,
          bottom: TabBar(
            onTap: (index) => controller.tab(index),
            isScrollable: true,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Borrowed'),
              Tab(text: 'Returned'),
              Tab(text: 'Favorites'),
              Tab(text: 'Reviews'),
            ],
          ),
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(flex: 4, child: Text('Activity')),
                    Expanded(child: Text('Date')),
                    Expanded(child: Text('Details')),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Active
                  _buildActivityList(controller),
                  // Overdue
                  _buildActivityList(controller, type: ActivityType.borrowing),
                  // Returned
                  _buildActivityList(controller, type: ActivityType.returned),
                  // favorite
                  _buildActivityList(controller, type: ActivityType.favorite),
                  // review
                  _buildActivityList(controller, type: ActivityType.review),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityList(
    ActivityHistoryController controller, {
    ActivityType? type,
  }) {
    List<ActivityHistoryItem> activities = controller.filteredActivities(
      type: type,
    );
    if (activities.isEmpty) {
      return Center(
        child: Text('No ${controller.activeTab.value} activities found.'),
      );
    }

    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final ActivityHistoryItem activity = activities[index];
        return ActivityHistoryItemTile(item: activity);
      },
    );
  }
}
