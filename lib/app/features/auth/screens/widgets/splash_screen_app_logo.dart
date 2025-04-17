import 'package:flutter/material.dart';
import 'package:lms/app/core/constants/image_path.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key, this.height = 100, this.width = 100});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePath.logoPng,
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
