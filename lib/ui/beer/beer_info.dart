import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/star_rating.dart';
import 'package:brewed/ui/brewery/brewery_page.dart';
import 'package:flutter/material.dart';

class BeerInfo extends StatelessWidget {
  final Beer beer;
  BeerInfo(this.beer);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Image.network("https://icon-library.com/images/beer-bottle-icon/beer-bottle-icon-6.jpg"),
        ),
        VerticalDivider(),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RichText(
                    text: TextSpan(
                      text: beer.name,
                      style: Theme.of(context).textTheme.headline6
                    )),
              ),

              Expanded(child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BreweryPage(beer.brewery))
                  );
                    },
                  child: Text(beer.brewery.name)),),
              Expanded(child: (beer.beerType != null) ? Text(beer.beerType) : Text(Constants.noData)),
              Expanded(child: (beer.barCode != null) ? Text(beer.barCode) : Text(Constants.noData),),
              Row(
                children: [
                  StarRating(starCount: 1, rating: 3.5/5),
                  Text("3.5/5")
                ],
              ),

            ],
          ),
        )
      ],
    );
  }

}
