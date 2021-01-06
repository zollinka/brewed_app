import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Constants.dart';

class NoInternetAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Constants.noInternet),
      content: Text(Constants.noInternetDesc),
      actions: <Widget> [
        TextButton(onPressed:  () {Navigator.of(context).pop();}, child: Text(Constants.alertButton))
      ],
    );
  }
}
