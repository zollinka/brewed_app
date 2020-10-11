import 'package:brewed/ui/beer/beer_list_view.dart';
import 'package:brewed/ui/home/settings_menu_popup.dart';
import 'package:flutter/material.dart';

import 'brewery_info.dart';

class BreweryPage extends StatefulWidget {
  @override
  _BreweryPageState createState() => _BreweryPageState();
}

class _BreweryPageState extends State<BreweryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BreweryPage"),
        actions: [
          settingsMenuPopup()
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                child: BreweryInfo()),
            Divider(),
            Expanded(
                flex: 2,
                child: BeerListView()
            )
          ],
        ),
      ),
    );

  }
}

