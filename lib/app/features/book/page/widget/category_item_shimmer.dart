import 'package:flutter/material.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';

class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        const ShimmerPlaceholder(
          height: 68,
          width: 68,
        ),
        ShimmerPlaceholder(
          width: 68,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
