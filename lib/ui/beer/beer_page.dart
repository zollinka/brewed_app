import 'package:brewed/ui/beer/beer_attributes.dart';
import 'package:brewed/ui/beer/beer_info.dart';
import 'package:brewed/ui/beer/star_rating.dart';
import 'package:flutter/material.dart';

class BeerPage extends StatefulWidget {
  @override
  _BeerPageState createState() => _BeerPageState();
}

class _BeerPageState extends State<BeerPage> {
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rate this app"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
            flex:3,
            child: BeerInfo()),
            Flexible(
              flex: 1,
              child: StarRating(
                rating: rating,
                onRatingChanged: (rating) => setState(() => this.rating = rating))),
            Flexible(
              flex: 3,
              child: BeerAtribbutes()
            )
          ],
        ),
      )
    );
  }
}
