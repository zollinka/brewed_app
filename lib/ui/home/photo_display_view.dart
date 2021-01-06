import 'dart:io';

import 'package:brewed/API.dart';
import 'package:brewed/db/DB.dart';
import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/alerts/no_internet_alert.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_page.dart';
import 'package:flutter/material.dart';

class PhotoDisplayView extends StatelessWidget {
  final String imagePath;
  const PhotoDisplayView({Key key, this.imagePath}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Constants.capturedPhoto)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(child: Image.file(File(imagePath))),
          Expanded(
              child: FlatButton(
                child: Text(Constants.searchWithPhoto),
            onPressed: () => _postToAPI(context),
          ))
        ],
      ),
    );
  }

  void _postToAPI(context) async
  {
    //showDialog(context: context,builder: (_) => NoInternetAlert(), barrierDismissible: true);
    try {var response = await API.predict(imagePath);
    _goToBeer(context, response);}
    catch (_) {
      showDialog(context: context,builder: (_) => NoInternetAlert(), barrierDismissible: true);
    }
  }

  void _goToBeer(context, response) async {
    //Beer beer = Beer.fromJson(response);
    Beer beer = await DB.getBeerByBarCode(response['label']);
    //Beer beer = await DB.getBeerByBarCode(response['barCode']['barCode']);
    Navigator.push(context,
        MaterialPageRoute(
          builder: (BuildContext context) => BeerPage(beer), //response.data.toString(),),
        ));
  }
}