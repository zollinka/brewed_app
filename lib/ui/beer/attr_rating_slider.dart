import 'package:brewed/ui/beer/attr_slider_thumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AttributeRatingSlider extends StatefulWidget {
  final Function(String attribute, double value) updateRatingValue;
  final double value;
  final String attribute;
  final double max;
  AttributeRatingSlider({this.value=0, this.attribute, this.max = 100, this.updateRatingValue});
  @override
  _AttributeRatingSliderState createState() => _AttributeRatingSliderState(value: value, attribute: attribute, max:max);
}

class _AttributeRatingSliderState extends State<AttributeRatingSlider> {
  double value;
  final String attribute;
  final double max;

  _AttributeRatingSliderState({this.value=0, this.attribute = ".", this.max = 100});

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
                  max: this.max,
                  divisions: 5,
                  onChanged: (double val) {setState(() {
                    this.value = val;
                    widget.updateRatingValue(attribute, val);
                  });},)

          ))]);
  }
}
