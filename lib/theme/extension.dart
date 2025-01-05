import 'package:flutter/material.dart';
import 'package:stroll/theme/colors.dart';

extension ThemeDataExtended on ThemeData {
  AppColorsTheme get appColors => extension<AppColorsTheme>()!;
}
