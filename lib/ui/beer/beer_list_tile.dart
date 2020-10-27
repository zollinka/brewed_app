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
          beer.name,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      subtitle: Text("Brewery name"),
      onTap: () {_goToBeer(context);}
    );
  }

  void _goToBeer(context){
    Navigator.push(context,
        MaterialPageRoute(
          builder: (BuildContext context) => BeerPage(), //response.data.toString(),),
        ));
  }
}
