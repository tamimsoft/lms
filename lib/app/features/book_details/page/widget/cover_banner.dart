import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/data/model/book_details.dart';
import 'package:lms/app/common/widget/custom_network_image.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/features/book_details/controller/book_details_controller.dart';

class BookCoverBanner extends StatelessWidget {
  const BookCoverBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final BookDetailsController controller = Get.find();
    return Stack(
      children: [
        SizedBox(
          height: 300, // ensures height is constrained
          width: double.infinity,
          child: Stack(
            children: [
              Obx(() {
                final BookDetails? bookD = controller.bookDetails.value;
                if (controller.isLoading.value || bookD == null) {
                  return ShimmerPlaceholder(height: 250);
                }
                return CustomNetworkImage(
                  imageUrl: bookD.coverUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  style: _buttonStyle(context),
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
              ),
              Positioned(
                top: 40,
                right: 10,
                child: Row(
                  children: [
                    IconButton(
                      style: _buttonStyle(context),
                      icon: Icon(Icons.favorite_outline),
                      onPressed: () {},
                    ),
                    IconButton(
                      style: _buttonStyle(context),
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 170,
          left: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(() {
                final BookDetails? bookD = controller.bookDetails.value;
                if (controller.isLoading.value || bookD == null) {
                  return ShimmerPlaceholder(height: 120, width: 90);
                }
                return CustomNetworkImage(
                  imageUrl: bookD.coverUrl,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 120,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 6),
                        ],
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }),
              SizedBox(width: 8),
              Column(
                children: [
                  Obx(() {
                    final BookDetails? bookD = controller.bookDetails.value;
                    if (controller.isLoading.value || bookD == null) {
                      return ShimmerPlaceholder(height: 20,width:  100);
                    }
                    return Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(bookD.avgRating.toStringAsFixed(1)),
                      ],
                    );
                  }),
                  SizedBox(height: 8),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
        context.theme.colorScheme.onSecondary,
      ),
    );
  }
}
