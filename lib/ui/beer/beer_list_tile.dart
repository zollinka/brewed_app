import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/beer_page.dart';
import 'package:flutter/material.dart';

class BeerListTile extends StatelessWidget {
  final Beer beer;

  BeerListTile({this.beer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          (beer.name != null) ? beer.name:  Constants.noData,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        trailing: (beer.brewery != null) ? (beer.brewery.name != null) ? Text(beer.brewery.name): Text(Constants.bitterness) :  Text(Constants.noData),
        subtitle: (beer.beerType != null) ? Text(beer.beerType): Text(Constants.noData),
        visualDensity: Theme.of(context).visualDensity,
        onTap: () {_goToBeer(context);}
    );
  }

  void _goToBeer(context){
    Navigator.push(context,
        MaterialPageRoute(
          builder: (BuildContext context) => BeerPage(beer),
        ));
  }
}
