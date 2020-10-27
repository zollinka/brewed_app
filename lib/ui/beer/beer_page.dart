import 'dart:convert';

import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_attributes.dart';
import 'package:brewed/ui/beer/beer_info.dart';
import 'package:brewed/ui/beer/star_rating.dart';
import 'package:brewed/ui/home/settings_menu_popup.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BeerPage extends StatefulWidget {
  @override
  _BeerPageState createState() => _BeerPageState();
}

class _BeerPageState extends State<BeerPage> {
  double rating = 3.5;
  Beer beer;

  bool _loading = true;
  
  @override
  void initState() {
    super.initState();
    _getBeerApi();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Bee"),
        actions: [
          settingsMenuPopup()
        ],
      ),
      body: SafeArea(
        child: _loading ? CircularProgressIndicator(): Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
            child: BeerInfo(beer)),
            Flexible(
              child: StarRating(
                rating: rating,
                onRatingChanged: (rating) => setState(() => this.rating = rating))),
            //Spacer(flex: 1,),
            Expanded(
              flex: 2,
              child: BeerAtribbutes(beer)
            )
          ],
        ),
      )
    );
  }
  Future <void> _getBeerApi()
  async {
    Dio dio = new Dio();
    dio.options.baseUrl= "http://demo9540477.mockable.io";
    dio.options.connectTimeout=30000;

    final response = await dio.get("/getbeer");
    print(response.data);
    setState(() {
      beer = Beer.fromJson(response.data);
      _loading = false;
    });
  }
}
