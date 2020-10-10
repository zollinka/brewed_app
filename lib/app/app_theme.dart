import 'package:flutter/material.dart';

import 'package:brewed/app/app_colors.dart';

class AppThemeDataFactory {
  static ThemeData prepareThemeData() => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    accentColor: AppColors.accent,
    backgroundColor: AppColors.background,

  textTheme: TextTheme(
  headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
  headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),)
  );
}