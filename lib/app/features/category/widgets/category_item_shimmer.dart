import 'package:lms/app/common/widgets/shimmer_placeholder.dart';
import 'package:flutter/material.dart';

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
