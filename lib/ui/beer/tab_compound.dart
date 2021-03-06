
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
        Flexible(child: AttributeSlider(value: (_beer.dryness != null) ? _beer.dryness * 100: null, attribute: Constants.dryness)),
        Flexible(child:AttributeSlider(value: (_beer.bitterness != null) ? _beer.bitterness * 100: null, attribute: Constants.bitterness)),
        Flexible(child:AttributeSlider(value: (_beer.sweetness != null) ? _beer.sweetness * 100: null , attribute: Constants.sweetness)),
        Flexible(child:AttributeSlider(value: (_beer.sourness != null) ? _beer.sourness * 100: null , attribute: Constants.sourness)),
        //Divider(),
        //Text("Note: " + _beer.note.toString())
      ],
    );
  }
}
