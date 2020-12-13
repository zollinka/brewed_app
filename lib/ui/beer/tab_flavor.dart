import 'package:brewed/ui/rating/Rating.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';
import 'attr_slider.dart';

class TabFlavor extends StatelessWidget {
  final Rating _rating;

  TabFlavor(this._rating);

  @override
  Widget build(BuildContext context) {
    return (_rating == null) ? Text("Rate beer first") :Column(
      children: [
        Flexible(child: AttributeSlider(value: (_rating.dryness != null) ? _rating.dryness: 0, attribute: Constants.dryness)),
        Flexible(child:AttributeSlider(value: (_rating.bitterness != null) ? _rating.bitterness: 0, attribute: Constants.bitterness)),
        Flexible(child:AttributeSlider(value: (_rating.sweetness != null) ? _rating.sweetness: 0 , attribute: Constants.sweetness)),
        Flexible(child:AttributeSlider(value: (_rating.sourness != null) ? _rating.sourness: 0 , attribute: Constants.sourness)),
      ],
    );
  }
}
