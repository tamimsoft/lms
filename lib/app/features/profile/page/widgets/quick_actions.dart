import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';
import 'package:lms/app/features/profile/model/quick_action_item_model.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = ProfileController.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          Column(
            children:
                controller.quickActions.map((action) {
                  return _buildAction(action);
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAction(QuickActionItem action) {
    return InkWell(
      onTap: () => Get.toNamed(action.route),
      child: Card(
        margin: EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: action.bg,
                child: Icon(action.icon, color: action.color, size: 20),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      action.title,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      action.description,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
