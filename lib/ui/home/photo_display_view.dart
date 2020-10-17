import 'dart:io';

import 'package:brewed/ui/beer/beer_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class PhotoDisplayView extends StatelessWidget {
  final String imagePath;
  const PhotoDisplayView({Key key, this.imagePath}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Captured photo')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Image.file(File(imagePath)),
          Expanded(
              child: FlatButton(
                child: Text("Search with this label"),
            onPressed: () => _postToAPI(context),

          ))

        ],
      ),
    );
  }

  Future <void> _postToAPI(context)
  async {
    Dio dio = new Dio();
    dio.options.baseUrl= "http://demo9540477.mockable.io";
    dio.options.connectTimeout=30000;

    FormData formData = new FormData.fromMap({"image": await MultipartFile.fromFile(imagePath)});
    final response = await dio.post("/predict",
      data: formData,
      onSendProgress: (int sent, int total) {
          print("$sent $total");}
    );
    _goToBeer(context, response);
  }

  void _goToBeer(context, response){
    Navigator.push(context,
        MaterialPageRoute(
          builder: (BuildContext context) => BeerPage(), //response.data.toString(),),
        ));
  }
}