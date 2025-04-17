import '/app/core/theme/custom/custom_theme.dart';
import '/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary,
      brightness: Brightness.light,
      ),
      useMaterial3: true,
      inputDecorationTheme: CustomInputDecorationTheme.light,
      elevatedButtonTheme: CustomElevatedButtonTheme.light,
      outlinedButtonTheme: CustomOutlinedButtonTheme.light,
      textButtonTheme: CustomTextButtonTheme.light,
      // scaffoldBackgroundColor: Colors.white,
      // appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.primary),
    );
  }
  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        // brightness: Brightness.dark,
      ),
      useMaterial3: true,
      inputDecorationTheme: CustomInputDecorationTheme.dark,
      elevatedButtonTheme: CustomElevatedButtonTheme.dark,
      outlinedButtonTheme: CustomOutlinedButtonTheme.dark,
      textButtonTheme: CustomTextButtonTheme.dark,
      scaffoldBackgroundColor: AppColors.secondary,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black12),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.primary),
    );
  }
}
