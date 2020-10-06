import 'package:flutter/material.dart';

import 'package:brewed/app/app_colors.dart';

class AppThemeDataFactory {
  static ThemeData prepareThemeData() => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    accentColor: AppColors.accent,
    backgroundColor: AppColors.background,
  );
}