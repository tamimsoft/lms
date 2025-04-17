import 'package:get/get.dart';
import 'package:lms/app/common/widgets/button_progress_indicator.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lms/app/features/auth/controllers/auth_state.dart';
import 'package:lms/app/features/auth/controllers/signup_controller.dart';
import 'package:lms/app/helper/snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/routes_name.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;

    return Obx(() {
      final status = controller.state.value.status;

      if (status == Status.authenticated) {
        Future.microtask(() => Get.toNamed(RoutesName.main));
      } else if (status == Status.error) {
        Future.microtask(
          () => AppSnackBar.error(
            context: context,
            message: controller.state.value.errorMsg,
          ),
        );
      }

      return ElevatedButton(
        onPressed:
            (status == Status.loading ||
                    controller.isButtonEnabled.value == false)
                ? null
                : () => controller.signUp(),
        child:
            (status == Status.loading)
                ? const ButtonProgressIndicator()
                : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppString.signUpText.toUpperCase()),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 16),
                  ],
                ),
      );
    });
  }
}
