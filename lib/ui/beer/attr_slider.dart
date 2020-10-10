import 'package:flutter/material.dart';

class AttributeSlider extends StatelessWidget {
  final double value;
  final String attribute;
  final double max;

  AttributeSlider({this.value=0, this.attribute, this.max = 100});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: this.value,
      label: this.value.toString(),
      min: 0,
      max: this.max
    );
  }
}


