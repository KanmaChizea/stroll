import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF1b181b);

  static const _grey = MaterialColor(0xFF6F6E7C, {
    50: Color(0xFFF5F5F5),
    100: Color(0xFFE5E5E5),
    300: Color(0xFFC4C4C4),
    500: Color(0xFF6F6E7C),
    800: Color(0xFF232A2E),
    900: Color(0xFF121517),
  });
  static const _purple = MaterialColor(
    0xFF8B88EF,
    {
      50: Color(0xFFECECFF),
      100: Color(0xFFCBC9FF),
      200: Color(0xFFCCC8FF),
      300: Color(0xFFB5B2FF),
      400: Color(0xFFB3ADF6),
      500: Color(0xFF8B88EF),
      600: Color(0xFF7A76D6),
      700: Color(0xFF6A66BF),
      800: Color(0xFF5A56A6),
      900: Color(0xFF403D7F),
    },
  );
}

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color background;
  final MaterialColor primary;
  final Color textDefault;
  final MaterialColor grey;

  const AppColorsTheme._internal({
    required this.background,
    required this.primary,
    required this.textDefault,
    required this.grey,
  });

  factory AppColorsTheme.light() {
    return const AppColorsTheme._internal(
      background: AppColors.white,
      primary: AppColors._purple,
      textDefault: AppColors.black,
      grey: AppColors._grey,
    );
  }

  factory AppColorsTheme.dark() {
    return const AppColorsTheme._internal(
      background: Color(0xFF0F1115),
      primary: AppColors._purple,
      textDefault: AppColors.black,
      grey: AppColors._grey,
    );
  }

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightMode}) {
    if (lightMode == null || lightMode) {
      return AppColorsTheme.light();
    }
    return AppColorsTheme.dark();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
      covariant ThemeExtension<AppColorsTheme>? other, double t) {
    return this;
  }
}
