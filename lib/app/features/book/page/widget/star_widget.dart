import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
    required this.rating,
    this.size = 16,
    this.maxStars = 5,
    this.filledColor = const Color(0xFFF4BC0E),
    this.unfilledColor = const Color(0xFFB0B0B0),
  });

  final double rating;
  final double size;
  final int maxStars;
  final Color filledColor;
  final Color unfilledColor;

  @override
  Widget build(BuildContext context) {
    final fullStars = rating.floor();
    final halfStar = (rating - fullStars) >= 0.5;
    final emptyStars = maxStars - fullStars - (halfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, size: size, color: filledColor),
        if (halfStar) Icon(Icons.star_half, size: size, color: filledColor),
        for (int i = 0; i < emptyStars; i++)
          Icon(Icons.star_border, size: size, color: unfilledColor),
      ],
    );
  }
}
