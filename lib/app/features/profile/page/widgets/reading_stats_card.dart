import 'package:flutter/material.dart';
import 'package:lms/app/features/profile/model/reading_stats_item_model.dart';

class ReadingStatsCard extends StatelessWidget {
  const ReadingStatsCard({super.key, required this.item});

  final ReadingStatsItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(20),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, color: item.color),
          SizedBox(height: 4),
          Text(item.label, style: TextStyle(fontSize: 10, color: Colors.grey)),
          Text(item.value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
