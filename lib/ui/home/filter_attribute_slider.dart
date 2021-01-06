import 'package:brewed/ui/home/filter_attribute_thumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class FilterAttributeSlider extends StatefulWidget {
  final Function(String attribute, RangeValues values) updateFilterValue;
  final double min;
  final double max;
  final String attribute;
  final double maxatr;

  FilterAttributeSlider(this.min,this.max, this.attribute, this.maxatr, this.updateFilterValue);
  @override
  _FilterAttributeSliderState createState() => _FilterAttributeSliderState(min, max, attribute, maxatr);
}

class _FilterAttributeSliderState extends State<FilterAttributeSlider> {
  double _min;
  double _max;
  final String _attribute;
  RangeValues _values;
  final double _maxatr;
  _FilterAttributeSliderState(this._min,this._max, this._attribute, this._maxatr);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _values = RangeValues(_min, _max);
    });
  }
  @override
  Widget build(BuildContext context) {

    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
            thumbShape: FilterAttributeSliderThumb(thumbRadius: 20,
                min: 0,
                max: _maxatr
            ),
          activeTrackColor: Theme.of(context).accentColor,
          inactiveTrackColor: Theme.of(context).indicatorColor,
          thumbColor: Theme.of(context).accentColor
        ),
        child: RangeSlider(
          values: _values,
          min: 0,
          max: _maxatr,
            labels: RangeLabels(
              _values.start.round().toString(),
              _values.end.round().toString(),
            ),
    divisions: 10,
    onChanged: (RangeValues val) {setState(() {
    this._values = val;
    widget.updateFilterValue(_attribute, _values);
    }
    );
  }));
}}

