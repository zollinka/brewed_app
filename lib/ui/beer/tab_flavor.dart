import 'package:flutter/material.dart';

import '../Constants.dart';
import 'attr_slider.dart';

class TabFlavor extends StatelessWidget {
  final double fruitness = 60.0;
  final double dryness = 10.0;
  final double bitterness = 20.0;
  final double sweetness = 30.0;
  final double sourness = 70.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: AttributeSlider(value: dryness, attribute: Constants.dryness)),
        Flexible(child:AttributeSlider(value: bitterness, attribute: Constants.bitterness)),
        Flexible(child:AttributeSlider(value: sweetness, attribute: Constants.sweetness)),
        Flexible(child:AttributeSlider(value: sourness, attribute: Constants.sourness)),
        Flexible(child:AttributeSlider(value: fruitness, attribute: Constants.fruitness))
      ],
    );
  }
}
