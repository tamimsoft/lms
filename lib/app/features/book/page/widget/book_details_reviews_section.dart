import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/data/model/book_details.dart';
import 'package:lms/app/features/book/page/widget/book_details_review_card.dart';
import 'package:lms/app/features/reviews/controller/reviews_controller.dart';

import 'star_widget.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.bookD});

  final BookDetails bookD;

  @override
  Widget build(BuildContext context) {
    ReviewsController controller = Get.put(ReviewsController());
    controller.getReviewsByBookId(bookD.id);
    final bookReviews = controller.reviews;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
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
          ),
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        bookD.avgRating.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      StarWidget(rating: bookD.avgRating.toDouble()),
                    ],
                  ),
                  SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${bookReviews.length} reviews'),
                      Text(
                        'Average rating',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  FilledButton.icon(
                    // onPressed: () => Get.toNamed('/bookD/$bookId/write-review'),
                    onPressed: () {},
                    icon: Icon(Icons.rate_review_outlined),
                    label: Text('Review'),
                  ),
                ],
              ),
            ),
          ),
          ...bookReviews
              .take(2)
              .map((review) => BookDetailsPageReviewCard(review: review)),
          if (bookReviews.length > 2)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: OutlinedButton.icon(
                onPressed: () => Get.toNamed('/reviews'),
                icon: Icon(Icons.message, size: 16),
                label: Text('View All ${bookReviews.length} Reviews'),
              ),
            ),
        ],
      ),
    );
  }
}
