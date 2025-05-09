import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget? child;

  const ShimmerPlaceholder({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;

    final baseColor =
        isDark
            ? Colors.grey[700]! // darker grey for dark theme
            : Colors.grey[300]!; // standard light grey

    final highlightColor =
        isDark
            ? Colors.grey[500]! // mid-grey highlight for dark theme
            : Colors.grey[100]!; // bright highlight for light theme

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        width: width ?? double.infinity,
        height: height,
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        ),
        child: child,
      ),
    );
  }
}
