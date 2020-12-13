
import 'package:brewed/ui/beer/Beer.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';
import 'attr_slider.dart';

class TabCompound extends StatelessWidget {
  final Beer _beer;

  TabCompound(this._beer);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: AttributeSlider(value: (_beer.dryness != null) ? _beer.dryness: 0, attribute: Constants.dryness)),
        Flexible(child:AttributeSlider(value: (_beer.bitterness != null) ? _beer.bitterness: 0, attribute: Constants.bitterness)),
        Flexible(child:AttributeSlider(value: (_beer.sweetness != null) ? _beer.sweetness: 0 , attribute: Constants.sweetness)),
        Flexible(child:AttributeSlider(value: (_beer.sourness != null) ? _beer.sourness: 0 , attribute: Constants.sourness)),
        //Divider(),
        //Text("Note: " + _beer.note.toString())
      ],
    );
  }
}
