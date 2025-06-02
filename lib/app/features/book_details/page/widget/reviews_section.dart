import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/features/reviews/controller/reviews_controller.dart';

import 'bd_review_card.dart';
import 'review_summary_card.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ReviewsController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            'Reviews',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ReviewSummaryCard(),
          SizedBox(height: 16),
          Obx(() {
            final reviews = controller.reviews;
            if (controller.isLoading.value || controller.reviews.isNotEmpty) {
              return ShimmerPlaceholder(
                height: 150,
              );
            }
            return Column(
              children:
                  reviews.take(2).map((r) => BDReviewCard(review: r)).toList(),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextButton(
          onPressed: () => Get.toNamed('/reviews'),
          child: Text(
            'See All',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
