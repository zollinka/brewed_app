import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/home/beer_guide_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeerGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _brewingTile = BeerGuideTile(Constants.brewingtitle,Constants.brewingdescription);
    final _beerStyleLowTile = ExpansionTile(
      title: Text(Constants.beerstylelowtitle),
      initiallyExpanded: true,
      childrenPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
      children: [
        BeerGuideTile(Constants.lagertitle, Constants.lagerdesc),
        BeerGuideTile(Constants.pilznertitle, Constants.pilznerdesc),
      ],
    );
    final _beerStyleHighTile = ExpansionTile(
      title: Text(Constants.beerstylehightitle),
      initiallyExpanded: true,
      childrenPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
      children: [
      ],
    );
    final _beerStyleTile = ExpansionTile(
      title: Text(Constants.beerstyletitle),
      initiallyExpanded: true,
      childrenPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
      children: [
        _beerStyleHighTile,
        _beerStyleLowTile
      ],
    );
    final _beerDictTile = ExpansionTile(
      title: Text(Constants.beerdictionarytitle),
      initiallyExpanded: false,
      childrenPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
      children: [
        BeerGuideTile(Constants.alcohol_percentage, Constants.alcoholDesc),
      BeerGuideTile(Constants.hops, Constants.hopsDesc),
      BeerGuideTile(Constants.yeast, Constants.yeastDesc),
      BeerGuideTile(Constants.blg, Constants.blgDesc),
        BeerGuideTile(Constants.ebc, Constants.ebcDesc),
        BeerGuideTile(Constants.ibu, Constants.ibuDesc),
        BeerGuideTile(Constants.malt, Constants.maltDesc),
        BeerGuideTile(Constants.water, Constants.waterDesc)
      ],
    );

    return Scaffold(
        appBar: AppBar(title: Text("Beer Guide")),
    body: SafeArea(child:ListView(
      children: [
        _brewingTile,
        _beerStyleTile,
        _beerDictTile
      ],
    )));
  }
}
