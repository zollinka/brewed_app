import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_attributes.dart';
import 'package:brewed/ui/beer/beer_info.dart';
import 'package:brewed/ui/beer/star_rating.dart';
import 'package:brewed/ui/home/settings_menu_popup.dart';
import 'package:flutter/material.dart';

class BeerPage extends StatefulWidget {
  final Beer _beer;

  BeerPage(this._beer);

  @override
  _BeerPageState createState() => _BeerPageState(_beer);
}

class _BeerPageState extends State<BeerPage> {
  double rating = 3.5;
  Beer beer;

  _BeerPageState(this.beer);

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          settingsMenuPopup()
        ],
      ),
      body: SafeArea(
        //child: _loading ? CircularProgressIndicator(): Column(
        child: Column(
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
              child: BeerAttributes(beer)
            )
          ],
        ),
      )
    );
  }

}
