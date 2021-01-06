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
        Flexible(child: _beer.alcoholPercentage != null ? AttributeSlider(value: _beer.alcoholPercentage*100, attribute: Constants.alcohol_percentage, max: 20,) : AttributeSlider(value: null, attribute: Constants.alcohol_percentage, max: 20,)),//Text(Constants.noData))
        Flexible(child: _beer.ibu != null ? AttributeSlider(value: _beer.ibu, attribute: Constants.ibu, max: 150) : AttributeSlider(value: null, attribute: Constants.ibu, max: 150)), //Text(Constants.noData)),
        Flexible(child: _beer.temperature != null ? AttributeSlider(value: _beer.temperature, attribute: Constants.temperature, max: 30,) :  AttributeSlider(value: null, attribute: Constants.temperature, max: 30,)),//Text(Constants.noData)),
        Expanded(child: Row(
          children: [
            Expanded(child: Text(Constants.note)),
            Spacer(),
            Expanded(child: _beer.note != null ? Text(_beer.note): Text(Constants.noData))
        ],
        ))
      ],
    );
  }
}
