
import 'package:flutter/material.dart';
import 'package:lms/app/core/constants/app_strings.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            endIndent: 16,
            color: Colors.grey.shade300,
          ),
        ),
        Text(
          AppString.orText,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        Expanded(
          child: Divider(
            indent: 16,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
