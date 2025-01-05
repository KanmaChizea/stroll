import 'package:flutter/material.dart';
import 'package:stroll/theme/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Proxima Nova',
    extensions: [AppColorsTheme.light()],
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: 'Proxima Nova',
    extensions: [AppColorsTheme.dark()],
  );
}
