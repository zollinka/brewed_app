import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_page.dart';
import 'package:brewed/ui/beer/favourites.dart';
import 'package:flutter/material.dart';

class BeerListTile extends StatefulWidget {
  final Beer beer;
  
  BeerListTile({this.beer});
  @override
  _BeerListTileState createState() => _BeerListTileState(beer);
}

class _BeerListTileState extends State<BeerListTile> {
  final Beer beer;
  bool fav;

  _BeerListTileState(this.beer);

  @override
  void initState() {
    super.initState();
    {setState(() {

      fav = Favourites.isFavourite(beer);});}
  }


  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          (beer.name != null) ? beer.name:  Constants.noData,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        subtitle: (beer.brewery != null) ? (beer.brewery.name != null) ? Text(beer.brewery.name): Text(Constants.bitterness) :  Text(Constants.noData),
        trailing:  new IconButton(
                icon: Icon( fav ? Icons.favorite: Icons.favorite_border, color: Theme.of(context).primaryColor),
                onPressed: () {_favourite();}),
        onTap: () {_goToBeer(context);}
    );
  }

  void _goToBeer(context){
    Navigator.push(context,
        MaterialPageRoute(
          builder: (BuildContext context) => BeerPage(beer),
        ));
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
