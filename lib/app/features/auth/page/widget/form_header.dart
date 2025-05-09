import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lms/app/core/constants/image_path.dart';
import 'package:lms/app/features/auth/controller/sign_in_and_sign_up_controller.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    required this.controller,
    required this.title,
    this.subTitle = '',
  });

  final SignInAndSignUpController controller;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: ToggleSwitch(
            activeFgColor: context.theme.colorScheme.onPrimary,
             activeBgColor: [context.theme.colorScheme.primary],
            totalSwitches: 2,
            labels: [AppString.loginText, AppString.signUpText],
            onToggle: (index) {
              controller.toggleMode(index!);
            },
          ),
        ),
        const SizedBox(height: 48),
        Container(decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22)
        ),
            child: Image.asset(ImagePath.logoPng, height: 100)),
        const SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
