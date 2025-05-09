import 'package:flutter/material.dart';
import 'package:lms/app/core/constants/image_path.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key, this.height = 100, this.width = 100});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Image.asset(ImagePath.logoPng, fit: BoxFit.contain),
    );
  }
}
