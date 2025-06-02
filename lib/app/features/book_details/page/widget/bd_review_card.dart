import 'package:flutter/material.dart';

import '../../../../common/data/model/review.dart';
import 'star_widget.dart';

class BDReviewCard extends StatelessWidget {
  const BDReviewCard({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final date =
        '${review.updatedAt.day}-${review.updatedAt.month}-${review.updatedAt.year}';
    return Card(
      margin: EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      review.userName,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    if (review.isMine)
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Chip(
                          label: Text('You'),
                          backgroundColor: Colors.grey[300],
                          labelStyle: TextStyle(fontSize: 10),
                        ),
                      ),
                  ],
                ),
                Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                StarWidget(rating: review.rating.toDouble(), size: 14),
                SizedBox(width: 6),
                Text(
                  '${review.rating}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(review.title, style: TextStyle(fontWeight: FontWeight.w600)),
            Text(review.body),
          ],
        ),
      ),
    );
  }
}
