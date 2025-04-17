import 'package:flutter/material.dart';
import 'package:lms/app/core/constants/image_path.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImagePath.logoPng, height: 100),
        const SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.black54)),
        Text(
          subTitle,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
