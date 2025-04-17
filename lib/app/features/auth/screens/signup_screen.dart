import 'package:flutter/material.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/core/constants/app_sizes.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lms/app/features/auth/controllers/signup_controller.dart';
import 'widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController _controller = SignupController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.defaultPadding),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              FormHeader(title: AppString.signupScreenTitleText,subTitle: AppString.signUpText,),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 20),
              SignupButton(),
              const SizedBox(height: 40),
              SignupOrLoginLink(
                text: AppString.alreadyHaveAccountText,
                link: AppString.loginText,
                route: RoutesName.login,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      onChanged: _controller.onChangeEmail,
      decoration: InputDecoration(labelText: AppString.emailText),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      onChanged: _controller.onChangePassword,
      decoration: InputDecoration(labelText: AppString.passwordText),
    );
  }
}
