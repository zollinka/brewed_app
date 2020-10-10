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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
            child: BeerInfo()),
            Flexible(
              child: StarRating(
                rating: rating,
                onRatingChanged: (rating) => setState(() => this.rating = rating))),
            //Spacer(flex: 1,),
            Expanded(
              flex: 2,
              child: BeerAtribbutes()
            )
          ],
        ),
      )
    );
  }
}
