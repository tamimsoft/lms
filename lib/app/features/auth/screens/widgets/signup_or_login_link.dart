import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_colors.dart';

class SignupOrLoginLink extends StatelessWidget {
  const SignupOrLoginLink({
    super.key,
    required this.text,
    required this.link,
    required this.route,
  });

  final String text;
  final String link;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(fontSize: 12, color: Colors.black54)),
            TextButton(
              onPressed: () {
                Get.toNamed(route);
              },
              child: Text(
                link,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
