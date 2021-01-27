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
          child: Image.asset('lib/assets/bottle2.jpg'),
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
                  StarRating(starCount: 1, rating: (beer.rating != null ) ? beer.rating/5: 0 /5),
                  (beer.rating != null ) ? Text(beer.rating.toStringAsFixed(2) + "/5"): Text(Constants.noRatings)
                ],
              ),

            ],
          ),
        )
      ],
    );
  }

}
