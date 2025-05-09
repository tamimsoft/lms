import '/app/core/theme/custom/custom_theme.dart';
import '/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => _theme(Brightness.light);

  static ThemeData get dark => _theme(Brightness.dark);

  static ThemeData _theme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      elevatedButtonTheme: CustomButtonTheme.eBTheme,
      filledButtonTheme: CustomButtonTheme.fBTheme,
      outlinedButtonTheme: CustomButtonTheme.oBTheme,
      inputDecorationTheme:
          brightness == Brightness.light
              ? CustomInputDecorationTheme.light
              : CustomInputDecorationTheme.dark,
    );
  }
}
