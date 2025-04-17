import 'package:flutter/material.dart';
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
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        width: width ?? double.infinity,
        height: height ?? 16.0,
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        ),
        child: child,
      ),
    );
  }
}
