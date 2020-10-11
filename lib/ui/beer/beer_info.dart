import 'package:brewed/ui/beer/star_rating.dart';
import 'package:brewed/ui/brewery/brewery_page.dart';
import 'package:flutter/material.dart';

class BeerInfo extends StatelessWidget {
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
                      text: "Beer name",
                      style: Theme.of(context).textTheme.headline6
                    )),
              ),

              Expanded(child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BreweryPage())
                  );
                    },
                  child: Text("Brewery Name")),),
              Expanded(child: Text("Beer Type")),
              Row(
                children: [
                  StarRating(starCount: 1, rating: 3.5),
                  Text("3.5/5")
                ],
              ),

            ],
          ),
        )
      ],
    );
  }

  void _goToBrewery() {
    /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BreweryPage())
    );*/
  }
}
