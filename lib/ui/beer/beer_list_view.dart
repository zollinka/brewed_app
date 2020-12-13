import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_list_tile.dart';
import 'package:brewed/ui/brewery/Brewery.dart';
import 'package:flutter/material.dart';

class BeerListView extends StatefulWidget {
  final List<Beer> _beers;

  BeerListView(this._beers);

  @override
  _BeerListViewState createState() => _BeerListViewState(_beers);
}

class _BeerListViewState extends State<BeerListView> {
  final List<Beer> _beers;

  _BeerListViewState(this._beers);

  @override
  Widget build(BuildContext context) {
    if (_beers != null) {
      final tiles = _beers.map(
            (Beer beer) {
          return BeerListTile(beer: beer);
        },);
    final beerTilesDivided = ListTile.divideTiles(context: context ,tiles: tiles).toList();
    return ListView(children: beerTilesDivided,);
  }
    return Container();
  }
}
