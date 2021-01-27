import 'package:brewed/app/app_theme.dart';
import 'package:brewed/app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:brewed/ui/home/home_page.dart';

class BrewedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeDataFactory.prepareThemeData(),
      home: SplashSc(),
    );
  }
}