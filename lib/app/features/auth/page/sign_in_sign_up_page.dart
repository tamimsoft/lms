import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lms/app/features/auth/controller/sign_in_and_sign_up_controller.dart';

import 'widget/widgets.dart';

class LoginAndSignUpPage extends StatelessWidget {
  LoginAndSignUpPage({super.key});

  final SignInAndSignUpController _controller = Get.put(
    SignInAndSignUpController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              FormHeader(
                controller: _controller,
                title: AppString.loginScreenTitleText,
              ),

              const SizedBox(height: 8),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 20),
              Obx(() {
                if (_controller.isSignInMode.value) {
                  return ForgetPasswordButton();
                }
                return _buildConfirmPasswordField();
              }),
              const SizedBox(height: 20),
              SignInAndSignUpButton(),
              const SizedBox(height: 40),
              CustomDivider(),
              const SizedBox(height: 40),
              SocialLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      onChanged: _controller.onChangeEmail,
      decoration: InputDecoration(
        labelText: AppString.emailText,
        prefixIcon: Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return Obx(() {
      final isObscure = _controller.obscurePassword.value;
      return TextField(
        onChanged: _controller.onChangePassword,
        obscureText: isObscure,
        decoration: InputDecoration(
          labelText: AppString.passwordText,
          prefixIcon: Icon(Icons.fingerprint),
          suffixIcon:
              _controller.isSignInMode.value
                  ? IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () => _controller.obscurePassword(!isObscure),
                  )
                  : null,
        ),
      );
    });
  }

  Widget _buildConfirmPasswordField() {
    return TextField(
      onChanged: _controller.onChangeConfirmPassword,
      decoration: InputDecoration(
        labelText: AppString.confirmPasswordText,
        prefixIcon: Icon(Icons.fingerprint),
      ),
    );
  }
}
