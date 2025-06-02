import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/profile/model/menu_item.dart';

class SettingsItemTile extends StatelessWidget {
  const SettingsItemTile({
    super.key,
    required this.item,
    this.showDivider = true,
  });

  final MenuItem item;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final iconColor = item.danger ? Colors.red : Colors.grey;
    final textColor = item.danger ? Colors.red : null;

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: Icon(item.icon, color: iconColor),
          title: Text(item.label, style: TextStyle(color: textColor)),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () => Get.toNamed(item.route),
        ),
        if (showDivider) const Divider(height: 1),
      ],
    );
  }
}
