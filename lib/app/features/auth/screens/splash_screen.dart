import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lms/app/features/auth/controllers/auth_controller.dart';

import 'widgets/splash_screen_app_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        Future.delayed(const Duration(seconds: 3), () {
          // 1.5 seconds
          Get.offAllNamed(
            controller.isAuthenticated.value
                ? RoutesName.main
                : RoutesName.login,
          );
        });
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 1),
                const AppLogoWidget(),
                Spacer(flex: 1),
                CircularProgressIndicator(color: AppColors.primary),
                const SizedBox(height: 16),
                Text(
                  AppString.version,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
