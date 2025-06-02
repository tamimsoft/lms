import 'package:flutter/material.dart';

import 'package:lms/app/features/profile/controllers/profile_controller.dart';
import 'package:lms/app/features/profile/model/menu_item.dart';

import 'settings_item_tile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    final menuItems = controller.menuItems;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Settings",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: List.generate(menuItems.length, (i) {
                final MenuItem item = menuItems[i];
                return SettingsItemTile(
                  item: item,
                  showDivider: i != menuItems.length - 1,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
