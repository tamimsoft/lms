import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:lms/app/features/home/controller/book_carousel_controller.dart';

import 'carousel_book_card.dart';

class BookCarousel extends StatelessWidget {
  const BookCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final BookCarouselController controller = BookCarouselController.instance;
    return Obx(() {
      if (controller.isLoading.value || controller.slideList.isEmpty) {
        return _buildPlaceholder();
      }
      return _buildContent(controller);
    });
  }

  Widget _buildPlaceholder() {
    return Column(
      spacing: 6,
      children: [
        ShimmerPlaceholder(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            for (int i = 0; i < 3; i++)
              const ShimmerPlaceholder(width: 13, height: 13),
          ],
        ),
      ],
    );
  }

  Widget _buildContent(BookCarouselController controller) {
    return Column(
      spacing: 6,
      children: [
        CarouselSlider.builder(
          itemCount: controller.slideList.length,
          itemBuilder: (context, index, _) {
            return CarouselBookCard(book: controller.slideList[index]);
          },
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              controller.updateSlideIndex(index);
            },
          ),
        ),
        _indicator(controller),
      ],
    );
  }

  Widget _indicator(BookCarouselController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.slideList.length,
        (index) => Container(
          width: 13,
          height: 13,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
            color:
                index == controller.sliderIndex.value
                    ? AppColors.primary
                    : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
