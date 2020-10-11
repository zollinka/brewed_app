import 'package:brewed/ui/beer/beer_list_tile.dart';
import 'package:flutter/material.dart';

class BeerListView extends StatefulWidget {
  @override
  _BeerListViewState createState() => _BeerListViewState();
}

class _BeerListViewState extends State<BeerListView> {
  final _beer_list = <String>[];

  @override
  Widget build(BuildContext context) {
    _beer_list.add('ABC');
    _beer_list.add('DEF');
    final tiles = _beer_list.map(
          (String beer) {
        return BeerListTile(beer: beer);
      },
    );
    final beer_tiles_divided = ListTile.divideTiles(context: context ,tiles: tiles).toList();
    return ListView(children: beer_tiles_divided,);
  }
}
