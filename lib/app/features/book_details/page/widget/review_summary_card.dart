import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/features/book/page/widget/star_widget.dart';
import 'package:lms/app/features/book_details/controller/book_details_controller.dart';
import 'package:lms/app/features/reviews/controller/reviews_controller.dart';

class ReviewSummaryCard extends StatelessWidget {
  const ReviewSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final BookDetailsController bookController = Get.find();
    final ReviewsController controller = Get.find();
    return Obx(() {
      final bookD = bookController.bookDetails.value;

      if (bookController.isLoading.value || bookD == null) {
        return ShimmerPlaceholder(height: 80);
      }
      return Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    bookD.avgRating.toString(),
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
                  Obx(() {
                    if (controller.isLoading.value ||
                        controller.reviews.isEmpty) {
                      return ShimmerPlaceholder(height: 16, width: 100);
                    }

                    return Text('${controller.reviews.length} reviews');
                  }),
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
      );
    });
  }
}
