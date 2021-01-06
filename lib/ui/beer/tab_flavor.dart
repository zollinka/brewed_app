import 'package:brewed/ui/rating/Rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Constants.dart';
import 'attr_slider.dart';

class TabFlavor extends StatelessWidget {
  final Rating _rating;

  TabFlavor(this._rating);

  @override
  Widget build(BuildContext context) {
    return _rating== null ? Stack(
        children: <Widget> [Column(
      children: [
        Flexible(child: AttributeSlider(value:null, attribute: Constants.dryness)),
        Flexible(child:AttributeSlider(value: null, attribute: Constants.bitterness)),
        Flexible(child:AttributeSlider(value:null , attribute: Constants.sweetness)),
        Flexible(child:AttributeSlider(value: null , attribute: Constants.sourness)),

      ],
    ),
        Positioned.fill(
    child: Center(
    child:Opacity(
    child:Container(
      color: Theme.of(context).backgroundColor,
    width: 400,
    height: 400,
    ),
      opacity: 0.6,
    ),
    )
        ),
          Positioned.fill(
              child:Center(
                  child: RichText(text: TextSpan(text: Constants.rateFirst, style: Theme.of(context).textTheme.headline4)))
              )
    ]
    ):
    Column(
      children: [
        Flexible(child: AttributeSlider(value:_rating.dryness, attribute: Constants.dryness)),
        Flexible(child:AttributeSlider(value: _rating.bitterness, attribute: Constants.bitterness)),
        Flexible(child:AttributeSlider(value:_rating.sweetness , attribute: Constants.sweetness)),
        Flexible(child:AttributeSlider(value: _rating.sourness , attribute: Constants.sourness)),
      ],
    )
    ;
  }
}
