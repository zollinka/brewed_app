import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeerGuideTile extends StatelessWidget {
  final _title;
  final _desc;
  BeerGuideTile(this._title,this._desc);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(_title),
      initiallyExpanded: false,
      children: [
        Text(_desc)
      ],
      childrenPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
    );
  }
}
