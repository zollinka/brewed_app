import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_list_tile.dart';
import 'package:brewed/ui/beer/beer_list_view.dart';
import 'package:brewed/ui/home/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWithFilters extends StatefulWidget {
  @override
  _SearchWithFiltersState createState() => _SearchWithFiltersState();
}

class _SearchWithFiltersState extends State<SearchWithFilters> {
  List<Beer> beers = [];
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Row( children: [
        Spacer(),
      TextButton(onPressed: () {
        _gotToFilters(context);
        }, child: Text(Constants.filter))
    ]),
    Expanded(child: ListView(children: beers.map(
    (Beer beer) {
    return BeerListTile(beer: beer);}).toList())//BeerListView(beers))
    )]);
  }

  Future<void> _gotToFilters(context) async{
    var beerList = await Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => FilterView(), //response.data.toString(),),
        ));

    if (beerList != null) {
      setState(() {
        beers = beerList;
      });
    }
  }
}
