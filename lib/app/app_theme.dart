import 'package:flutter/material.dart';

import 'package:brewed/app/app_colors.dart';

class AppThemeDataFactory {
  static ThemeData prepareThemeData() => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    accentColor: AppColors.accent,
    backgroundColor: AppColors.background,
    disabledColor: AppColors.disabled,
    indicatorColor: AppColors.lightaccent,
  visualDensity: VisualDensity.comfortable,
  buttonColor: AppColors.disabled,
  textTheme: TextTheme(
  headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
  headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
    bodyText1: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),).apply(
    bodyColor: AppColors.textBody
  ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.accent,
      ),
    ),

  );
}