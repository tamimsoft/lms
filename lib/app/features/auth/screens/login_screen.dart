import 'package:flutter/material.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/core/constants/app_sizes.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lms/app/features/auth/controllers/login_controller.dart';

import 'widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController _controller = LoginController.instance;

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
              FormHeader(title: AppString.loginScreenTitleText,subTitle: AppString.loginText,),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              ForgetPasswordButton(),
              const SizedBox(height: 20),
              LoginButton(),
              const SizedBox(height: 40),
              CustomDivider(),
              const SizedBox(height: 40),
              SocialLoginButton(),
              const Spacer(),
              SignupOrLoginLink(
                text: AppString.dontHaveAccountText,
                link: AppString.signUpText,
                route: RoutesName.signup,
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
      decoration: InputDecoration(labelText: AppString.emailText,prefixIcon: Icon(Icons.email_outlined)),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    final isObscure = _controller.obscurePassword.value;
    return TextField(
      onChanged: _controller.onChangePassword,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: AppString.passwordText,
        prefixIcon: Icon(Icons.fingerprint),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () => _controller.obscurePassword(!isObscure),
        ),
      ),
    );
  }
}
