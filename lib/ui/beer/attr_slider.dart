import 'package:brewed/ui/beer/attr_slider_thumb.dart';
import 'package:flutter/material.dart';

class AttributeSlider extends StatelessWidget {
  final double value;
  final String attribute;
  final double max;

  AttributeSlider({this.value=0, this.attribute, this.max = 100});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
    Flexible(child: Row(
    children: <Widget>[
    Expanded(
        child: Divider()
    ),

    Text(attribute),

    Expanded(
    child: Divider()
    ),
    ]
    ),),
          Flexible( child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
            thumbShape: AttributeSliderThumb(thumbRadius: 20,
            value: this.value
            )
            ),
            child: Slider(
            value: this.value,
            min: 0,
            max: this.max
            )
          ))]);
  }
}


