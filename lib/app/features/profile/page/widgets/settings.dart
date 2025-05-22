import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              "Settings",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.menuItems.length,
              separatorBuilder: (_, __) => Divider(height: 1),
              itemBuilder: (_, i) {
                final item = controller.menuItems[i];
                return ListTile(
                  leading: Icon(
                    item['icon'] as IconData,
                    color: item['danger'] == true ? Colors.red : Colors.grey,
                  ),
                  title: Text(
                    item['label'] as String,
                    style: TextStyle(
                      color: item['danger'] == true ? Colors.red : null,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () => Get.toNamed(item['route'] as String),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
