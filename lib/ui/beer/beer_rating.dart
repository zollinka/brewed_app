import 'package:brewed/API.dart';
import 'package:brewed/db/DB.dart';
import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/attr_rating_slider.dart';
import 'package:brewed/ui/beer/beer_page.dart';
import 'package:brewed/ui/beer/star_rating.dart';
import 'package:brewed/ui/rating/Rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeerRating extends StatefulWidget {
  final Beer _beer;
  BeerRating(this._beer);
  @override
  _BeerRatingState createState() => _BeerRatingState(this._beer);
}

class _BeerRatingState extends State<BeerRating> {
  Rating _rating;
  Beer _beer;
  _BeerRatingState(this._beer);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRating();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    ),
    body: SafeArea(
    //child: _loading ? CircularProgressIndicator(): Column(
    child: Padding(
      padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Center(child:RichText(text: TextSpan(text: _beer.name, style: Theme.of(context).textTheme.headline5))),
    Flexible(
    child: StarRating(
        rating: (_rating != null) ? (_rating.rating != null) ? _rating.rating: 0: 0,
        onRatingChanged: (rating) => setState(() => this._rating.rating = rating))
    ),
      Flexible(child: Row(
          children: <Widget>[
            Expanded(
                child: Divider()
            ),

            Text(Constants.optional),

            Expanded(
                child: Divider()
            ),
          ]
      ),),
    Flexible(child: AttributeRatingSlider(value: (_rating != null) ? (_rating.dryness != null) ? _rating.dryness: 0: 0, attribute: Constants.dryness, updateRatingValue: _updateRating,)),
      Flexible(child: AttributeRatingSlider(value: (_rating != null) ? (_rating.sourness != null) ? _rating.sourness: 0: 0, attribute: Constants.sourness, updateRatingValue: _updateRating)),
      Flexible(child: AttributeRatingSlider(value: (_rating != null) ? (_rating.sweetness != null) ? _rating.sweetness: 0: 0, attribute: Constants.sweetness, updateRatingValue: _updateRating)),
      Flexible(child: AttributeRatingSlider(value: (_rating != null) ? (_rating.bitterness != null) ? _rating.bitterness: 0: 0, attribute: Constants.bitterness, updateRatingValue: _updateRating)),
      Flexible(child: FlatButton(child: Text(Constants.rate), onPressed: () {_saveRating(context);},),)
    ]))));
  }

  void _getRating()async{
    var rating = await DB.getRatingByBeer(_beer.id);
    if (rating== null){
      _rating = new Rating(_beer.id);
      print("xxx");
    }
    else{
      setState(() {
        _rating = rating;
      });
    }
  }

  void _saveRating(context) async{
    await API.putRating(_rating);
    await DB.insertRating(_rating);
    print(_rating);
    _goToBeer(context);
  }

  void _goToBeer(context) {
    Navigator.pop(context);/*push(context,
        MaterialPageRoute(
          builder: (BuildContext context) => BeerPage(_beer), //response.data.toString(),),
        ));*/
  }

  void _updateRating(String attribute, double value){
    if (attribute == Constants.bitterness){
      setState(() {
        _rating.bitterness = value;
      });
    }
    else if (attribute == Constants.dryness){
      setState(() {
        _rating.dryness = value;
      });
    }
    else if (attribute == Constants.sweetness){
      setState(() {
        _rating.sweetness = value;
      });
    }
    else if (attribute == Constants.sourness){
      setState(() {
        _rating.sourness = value;
      });
    }
  }
}
