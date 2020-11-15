import 'package:brewed/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashSc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new HomePage(),
      image: new Image.asset('lib/assets/logo_brewed.png'),
      loadingText: Text("Loading..."),
      photoSize: 200.0,
      loaderColor: Theme.of(context).primaryColor,
    );
  }
}