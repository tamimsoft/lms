import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/core/constants/image_path.dart';
import 'package:lms/app/features/auth/controllers/github_login_controller.dart';
import 'package:lms/app/features/auth/controllers/google_login_controller.dart';
import 'package:lms/app/helper/snack_bar.dart';

class SocialLoginButton extends StatelessWidget {
  SocialLoginButton({super.key});

  final GoogleLoginController _googleLC = Get.put(GoogleLoginController());
  final GithubLoginController _gitLC = Get.put(GithubLoginController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildButton(
          label: 'Google',
          iconPath: ImagePath.googleSvg,
          onPressed: () => _googleLC.loginWithGoogle(),
          controller: _googleLC,
          context: context,
        ),
        SizedBox(width: 16), // spacing
        _buildButton(
          label: 'GitHub',
          iconPath: ImagePath.githubSvg,
          onPressed: () => _gitLC.loginWithGithub(),
          controller: _gitLC,
          context: context,
        ),
      ],
    );
  }

  Widget _buildButton({
    required String label,
    required String iconPath,
    required VoidCallback onPressed,
    required dynamic controller,
    required BuildContext context,
  }) {
    return Expanded(
      child: Obx(() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (controller.isAuthenticated.value) {
            Future.microtask(() => Get.offAllNamed(RoutesName.main));
          } else if (controller.errorMsg.value.isNotEmpty) {
            AppSnackBar.error(context: context, message: controller.errorMsg.value);
          }else{
            CircularProgressIndicator();
          }
        });

        return OutlinedButton.icon(
          label: Text(label),
          icon: SizedBox(
            width: 30,
            height: 30,
            child: controller.isLoading.value
                ? const CircularProgressIndicator()
                : SvgPicture.asset(iconPath),
          ),
          onPressed: controller.isLoading.value ? null : onPressed,
        );
      }),
    );
  }
}
