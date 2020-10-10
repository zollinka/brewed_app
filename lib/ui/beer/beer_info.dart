import 'package:brewed/ui/beer/star_rating.dart';
import 'package:flutter/material.dart';

class BeerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 4,
          child: Icon(Icons.camera),
        ),
        Spacer(flex: 1),
        Flexible(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text("Baaaaaaaaaaaaardzo dluga nazwa piwa"),
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
