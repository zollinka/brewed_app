import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_list_tile.dart';
import 'package:brewed/ui/beer/beer_list_view.dart';
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
    )),
        //Expanded(child: BeerListView())
      ],
    );

  }
}

Future<List<Beer>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(search.length, (int index) {
    return Beer("Jajco");
  });
}


