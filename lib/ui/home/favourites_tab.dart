import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_list_view.dart';
import 'package:brewed/ui/beer/favourites.dart';
import 'package:flutter/widgets.dart';

class FavouritesTab extends StatefulWidget {
  @override
  _FavouritesTabState createState() => _FavouritesTabState();
}

class _FavouritesTabState extends State<FavouritesTab> {
  final List<Beer> _favBeers = Favourites.favourites.toList();

  @override
  Widget build(BuildContext context) {
    _favBeers.sort((a, b) => a.name.compareTo(b.name));
    return (_favBeers.length != 0) ? BeerListView(_favBeers): Center(child: Text(Constants.emptyfavorites),);
  }
}
