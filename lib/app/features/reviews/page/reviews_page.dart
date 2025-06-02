import 'package:flutter/material.dart';
import 'package:lms/app/common/widget/custom_app_bar.dart';
import 'package:lms/app/features/reviews/controller/reviews_controller.dart';

import 'widget/review_card.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReviewsController controller = ReviewsController.instance;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackButton: true,
          title: 'Book Reviews',
          actions: [
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, size: 16),
              label: Text('Write Review'),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'My Reviews (${controller.myReviews.length})'),
              Tab(text: 'Community Reviews'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _reviewList(controller.myReviews),
            _reviewList(controller.communityReviews),
          ],
        ),
      ),
    );
  }

  Widget _reviewList(List<ReviewTemp> reviews) {
    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, i) => ReviewCard(review: reviews[i]),
    );
  }
}
