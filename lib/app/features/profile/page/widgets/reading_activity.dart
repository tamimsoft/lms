import 'package:flutter/material.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';

import 'reading_stats_card.dart';

class ReadingActivity extends StatelessWidget {
  const ReadingActivity({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Reading Activity",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.readingStats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (_, i) {
            final item = controller.readingStats[i];
            return ReadingStatsCard(item: item);
          },
        ),
      ],
    );
  }
}

