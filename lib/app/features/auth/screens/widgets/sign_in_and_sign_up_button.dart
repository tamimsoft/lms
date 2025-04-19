import 'package:get/get.dart';
import 'package:lms/app/common/widgets/button_progress_indicator.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lms/app/features/auth/controllers/sign_in_and_sign_up_controller.dart';
import 'package:lms/app/helper/snack_bar.dart';
import 'package:flutter/material.dart';

class SignInAndSignUpButton extends StatelessWidget {
  const SignInAndSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignInAndSignUpController.instance;

    return Obx(() {
      if (controller.isAuthenticated.value) {
        Future.microtask(() => Get.offAllNamed(RoutesName.main));
      } else if (!controller.isAuthenticated.value &&
          controller.errorMsg.value.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AppSnackBar.error(
            context: context,
            message: controller.errorMsg.value,
          );
        });
      }
      final String buttonText =
          controller.isSignInMode.value
              ? AppString.loginText
              : AppString.signUpText;
      return ElevatedButton(
        onPressed:
            (controller.isLoading.value ||
                    controller.isButtonEnabled.value == false)
                ? null
                : () => controller.signInOrSignUp(),
        child:
            controller.isLoading.value
                ? const ButtonProgressIndicator()
                : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(buttonText.toUpperCase()),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 16),
                  ],
                ),
      );
    });
  }
}
