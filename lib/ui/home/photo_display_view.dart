import 'dart:io';

import 'package:brewed/API.dart';
import 'package:brewed/db/DB.dart';
import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/alerts/no_internet_alert.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_page.dart';
import 'package:flutter/material.dart';

class PhotoDisplayView extends StatefulWidget {
  final String imagePath;
  const PhotoDisplayView({Key key, this.imagePath}) : super(key:key);
  @override
  _PhotoDisplayViewState createState() => _PhotoDisplayViewState(imagePath);
}

class _PhotoDisplayViewState extends State<PhotoDisplayView> {
  final String imagePath;
  bool _searching = false;
  _PhotoDisplayViewState(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Constants.capturedPhoto)),
      body: _searching ? Center(child:CircularProgressIndicator() ):Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Image.file(File(imagePath), fit: BoxFit.fill,),

              Center(
                child:OutlineButton(
                  child: Text(Constants.searchWithPhoto),
                  onPressed: () => _postToAPI(context),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          )
    )
        ],
      ),
    );
  }

  void _postToAPI(context) async
  {
    setState(() {
      _searching = true;
    });
    //showDialog(context: context,builder: (_) => NoInternetAlert(), barrierDismissible: true);
    try {var response = await API.predict(imagePath);
    _goToBeer(context, response);}
    catch (_) {
      setState(() {
        _searching = false;
      });
      showDialog(context: context,builder: (_) => NoInternetAlert(), barrierDismissible: true);
    }

  }

  void _goToBeer(context, response) async {

    Beer beer = Beer.fromJson(response[0]);
    setState(() {
      _searching = false;
    });
    //Beer beer = await DB.getBeerByBarCode(response['label']);
    //Beer beer = await DB.getBeerByBarCode(response['barCode']['barCode']);
    Navigator.push(context,
        MaterialPageRoute(
          builder: (BuildContext context) => BeerPage(beer), //response.data.toString(),),
        ));
  }
}