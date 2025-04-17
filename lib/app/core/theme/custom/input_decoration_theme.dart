import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomInputDecorationTheme {
  CustomInputDecorationTheme._();

  static InputDecorationTheme get light {
    return InputDecorationTheme(
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
      floatingLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1.5, color: AppColors.primary),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1),
      ),
    );
  }
  static InputDecorationTheme get dark {
    return InputDecorationTheme(
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
      floatingLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: Colors.grey.shade600),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1.5, color: AppColors.primary),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1),
      ),
    );
  }
}
