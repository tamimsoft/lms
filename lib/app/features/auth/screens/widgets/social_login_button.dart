import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/app/core/constants/image_path.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      spacing: 16,
      children: [
        _buildButton(
          label: 'Google',
          iconPath: ImagePath.googleSvg,
          onPressed: () {},
        ),
        _buildButton(
          label: 'GitHub',
          iconPath: ImagePath.githubSvg,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildButton({
    required String label,
    required String iconPath,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: OutlinedButton.icon(
        label: Text(label),
        icon: SizedBox(
          width: 30,
          height: 30,
          child: SvgPicture.asset(iconPath),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
