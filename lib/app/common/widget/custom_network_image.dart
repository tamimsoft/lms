import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/image_path.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'shimmer_placeholder.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageBuilder,
    this.width,
    this.height,
    this.fit,
  });

  final String imageUrl;
  final ImageWidgetBuilder? imageBuilder;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => const ShimmerPlaceholder(),
      errorWidget:
          (context, url, error) => Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(ImagePath.imageNotFoundPng),
            ),
            //child: Image.asset(ImagePath.noFoundPng),
          ),
    );
  }
}
