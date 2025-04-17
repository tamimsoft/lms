import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  static ElevatedButtonThemeData get light {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 48),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
  static ElevatedButtonThemeData get dark {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 48),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
