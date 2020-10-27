import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_list_tile.dart';
import 'package:flutter/material.dart';

class BeerListView extends StatefulWidget {
  @override
  _BeerListViewState createState() => _BeerListViewState();
}

class _BeerListViewState extends State<BeerListView> {
  final _beerList = <Beer>[];

  @override
  Widget build(BuildContext context) {
    _beerList.add(Beer('ABC'));
    _beerList.add(Beer('DEF'));
    final tiles = _beerList.map(
          (Beer beer) {
        return BeerListTile(beer: beer);
      },
    );
    final beerTilesDivided = ListTile.divideTiles(context: context ,tiles: tiles).toList();
    return ListView(children: beerTilesDivided,);
  }
}
