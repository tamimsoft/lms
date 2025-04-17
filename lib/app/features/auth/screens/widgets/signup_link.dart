import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/core/constants/app_colors.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account yet? ",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(RoutesName.login);
              },
              child: Text(
                'Sign up',
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
