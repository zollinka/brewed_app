//TODO range_slider or slider ?
import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/attr_slider.dart';
import 'package:flutter/material.dart';

class TabInfo extends StatelessWidget {
  final double ibu = 60.0;
  final double temp = 12.0;
  final double percent = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: AttributeSlider(value: ibu, attribute: Constants.ibu, max: 150)),
        Flexible(child:AttributeSlider(value: temp, attribute: Constants.temperature, max: 30,)),
        Flexible(child:AttributeSlider(value: percent, attribute: Constants.alcohol_percentage, max: 20,))
      ],
    );
  }
}
