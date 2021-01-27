import 'package:brewed/ui/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Constants.about)),
        body: SafeArea(
            child: Column(
              children: [
                Center(child: Image.asset('lib/assets/brewed_title.png',),),
                Divider(),
                Center(child: Text(Constants.version))
              ],
            )
        ));
  }
}
