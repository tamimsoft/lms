import '/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._();

  static OutlinedButtonThemeData get light {
    return OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 48),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
  static OutlinedButtonThemeData get dark {
    return OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 48),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
