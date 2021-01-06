import 'package:brewed/API.dart';
import 'package:brewed/db/DB.dart';
import 'package:brewed/ui/alerts/no_internet_alert.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_attributes.dart';
import 'package:brewed/ui/beer/beer_info.dart';
import 'package:brewed/ui/beer/beer_rating.dart';
import 'package:brewed/ui/beer/favourites.dart';
import 'package:brewed/ui/beer/star_rating.dart';
import 'package:brewed/ui/home/settings_menu_popup.dart';
import 'package:brewed/ui/rating/Rating.dart';
import 'package:flutter/material.dart';

class BeerPage extends StatefulWidget {
  final Beer _beer;

  BeerPage(this._beer);

  @override
  _BeerPageState createState() => _BeerPageState(_beer);
}

class _BeerPageState extends State<BeerPage> {
  Rating rating;
  Beer beer;
  bool fav;
  bool _loading = true;

  _BeerPageState(this.beer);
  @override
  void initState() {
    super.initState();
    _getAttributes();
    _getRating();
    setState(() {

      fav = Favourites.isFavourite(beer);});
      _loading = false;

  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _loading ? CircularProgressIndicator(): Scaffold(
      appBar: AppBar(
        actions: [
          new IconButton(
              icon: Icon( fav ? Icons.favorite: Icons.favorite_border, color: Theme.of(context).accentColor),
              onPressed: () {_favourite();}),
          SettingsMenuPopup(),
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
                rating: (rating != null) ? rating.rating: 0,
                onRatingChanged: (rating) => _setRating(context, rating))),
            //Spacer(flex: 1,),
            Expanded(
              flex: 2,
              child: BeerAttributes(beer, rating)
            )
          ],
        ),
      )
    );
  }
  void _getRating() async{
    try{
    Rating rating = await DB.getRatingByBeer(beer.id);
    setState(() {
      this.rating = (rating != null) ? rating: null;
    });}
    catch (error) {
      print(error);
      Navigator.of(context).pop();
      showDialog(context: context,builder: (_) => NoInternetAlert(), barrierDismissible: true);
    }
  }

  void _getAttributes() async{
    try{
      var data = await API.getAttributeOfBeer(this.beer.id);
    Beer beerA = (data != null) ? this.beer.update(data): this.beer;
    setState(() { this.beer = beerA;});}
    catch (error) {
      print(error);
    Navigator.of(context).pop();
    showDialog(context: context,builder: (_) => NoInternetAlert(), barrierDismissible: true);
    }
  }

  void _setRating(context, rating){
    //setState(() { this.rating.rating = rating;});
    _goToRating(context);
  }

  Future<void> _goToRating(context) async {
    await Navigator.push(context,
        MaterialPageRoute(
          builder: (BuildContext context) => BeerRating(beer),
        ));
    _getRating();
    _getAttributes();
  }

  void _favourite(){
    setState(() {
      if (Favourites.isFavourite(beer)){
        Favourites.removeFavourite(beer);
        fav = false;
      }
      else {
        Favourites.addFavourite(beer);
        fav = true;
      }
    });
  }
}
