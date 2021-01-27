import 'package:brewed/db/DB.dart';
import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_list_tile.dart';
import 'package:brewed/ui/home/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWithFilters extends StatefulWidget {
  @override
  _SearchWithFiltersState createState() => _SearchWithFiltersState();
}

class _SearchWithFiltersState extends State<SearchWithFilters> {
  List<Beer> beers = [];
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBeers();
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return _loading ? Center(child:CircularProgressIndicator()):Column(
    children: [
      Row( children: [
        Spacer(),
      TextButton(onPressed: () {
        _gotToFilters(context);
        }, child: Text(Constants.filter))
    ]),
      (beers.length != 0) ? Expanded(child:
      ListView(children: beers.map(
    (Beer beer) {
    return BeerListTile(beer: beer);}).toList())//BeerListView(beers))
    )
      :
    Center(child:Text(Constants.noDataFilter))
    ]);
  }

  Future<void> _gotToFilters(context) async{
    setState(() {
      _loading = true;
      beers = [];
    });
    var beerList = await Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => FilterView(), //response.data.toString(),),
        ));

    if (beerList != null) {
      setState(() {
        beers = beerList;
        _loading = false;
      });
    }
  }
  Future<void> _getBeers() async{
    setState(() {
      _loading = true;
    });
    var beerList = await DB.getBeers();
    setState(() {
      beers = beerList;
      _loading = false;
    });
  }
}
