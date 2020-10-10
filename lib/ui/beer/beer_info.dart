import 'package:brewed/ui/beer/star_rating.dart';
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
        Spacer(flex: 1),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RichText(
                    text: TextSpan(
                      text: "Baaaaaaaaaaaaardzo dluga nazwa piwa",
                      style: Theme.of(context).textTheme.headline6
                    )),
              ),
              Expanded(child: Text("Nazwa browaru")),
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
}
