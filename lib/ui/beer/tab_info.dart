//TODO range_slider or slider ?
import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/attr_slider.dart';
import 'package:flutter/material.dart';

import 'Beer.dart';

class TabInfo extends StatelessWidget {
  final Beer _beer;

  TabInfo(this._beer);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: _beer.ibu != null ? AttributeSlider(value: _beer.ibu, attribute: Constants.ibu, max: 150) : Text(Constants.noData)),
        Flexible(child: _beer.temperature != null ? AttributeSlider(value: _beer.temperature, attribute: Constants.temperature, max: 30,) : Text(Constants.noData)),
        Flexible(child: _beer.alcoholPercentage != null ? AttributeSlider(value: _beer.alcoholPercentage, attribute: Constants.alcohol_percentage, max: 20,) : Text(Constants.noData))
      ],
    );
  }
}
