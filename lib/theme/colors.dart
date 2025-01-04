import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF1b181b);

  static const _grey = MaterialColor(0xFF, {});
}

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color background;
  final Color primary;
  final Color primaryAccent;
  final Color textDefault;
  final MaterialColor grey;

  const AppColorsTheme._internal({
    required this.background,
    required this.primary,
    required this.primaryAccent,
    required this.textDefault,
    required this.grey,
  });

  factory AppColorsTheme.light() {
    return const AppColorsTheme._internal(
      background: AppColors.white,
      primary: Color(0xFF8B88EF),
      primaryAccent: Color(0xFFCBC9FF),
      textDefault: AppColors.black,
      grey: AppColors._grey,
    );
  }

  factory AppColorsTheme.dark() {
    return const AppColorsTheme._internal(
      background: AppColors.black,
      primary: Color(0xFF8B88EF),
      primaryAccent: Color(0xFFCBC9FF),
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
