import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/attr_slider_thumb.dart';
import 'package:flutter/material.dart';

class AttributeSlider extends StatelessWidget {
  final double value;
  final String attribute;
  final double max;

  AttributeSlider({this.value, this.attribute, this.max = 100});

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
          this.value != null ?
          Flexible( child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
            thumbShape: AttributeSliderThumb(thumbRadius: 20,
            value: this.value
            ),
                activeTrackColor: Theme.of(context).accentColor,
                inactiveTrackColor: Theme.of(context).indicatorColor,
                thumbColor: Theme.of(context).accentColor
            ),
            child: Slider(
            value: this.value,
            min: 0,
            max: this.max
            ),
          )) :
        Flexible(child: Opacity(
          opacity: 0.3,
          child:
            SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: AttributeSliderThumb(thumbRadius: 20,
                      value: 0
                  ),
                    activeTrackColor: Theme.of(context).accentColor,
                    inactiveTrackColor: Theme.of(context).indicatorColor,
                    thumbColor: Theme.of(context).accentColor

    ),
                child: Slider(
                  value: 0,
                  min: 0,
                  max: this.max,
                )
            ),
        )

        )]);
  }
}


