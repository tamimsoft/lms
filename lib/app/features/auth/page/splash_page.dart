import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lms/app/features/auth/controller/auth_controller.dart';

import 'widget/splash_screen_app_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = AuthController.instance;
    bool navigated = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (navigated) return;
      navigated = true;
      Future.delayed(const Duration(seconds: 3), () {
        final _ = controller.isAuthenticated.value;
        // Get.offAllNamed(isLoggedIn ? RoutesName.main : RoutesName.login);
        Get.offAllNamed(RoutesName.main);
      });
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const AppLogoWidget(),
            const Text(
              AppString.appName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const Spacer(flex: 1),
            const CircularProgressIndicator(color: AppColors.primary),
            const SizedBox(height: 16),
            Text(
              AppString.version,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
