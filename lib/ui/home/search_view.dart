import 'package:brewed/db/DB.dart';
import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_list_tile.dart';
import 'package:brewed/ui/beer/favourites.dart';
import 'package:brewed/ui/beer/history.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {

  @override
  _SearchViewState createState() =>
    _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var beers = new List<Beer>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
    child: SearchBar<Beer>(
            onSearch: search,
            onItemFound: (Beer beer, int index) {
              return BeerListTile(beer: beer);
            },
      suggestions: History.history.toList(),
            onError: (error) {
              return Center(
                child: Text(Constants.noInternet),
              );
            },
      hintText: Constants.placeholder,
      emptyWidget: Text(Constants.emptysearch),
      cancellationText: Text(Constants.cancel),
      //suggestions: Favourites.favourites.toList(),


    )),
      ],
    );

  }
}

Future<List<Beer>> search(String search) async {
  await Future.delayed(Duration(seconds: 1));
  return DB.searchBeers(search);
}


