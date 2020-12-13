import 'package:brewed/db/DB.dart';
import 'package:brewed/ui/beer/beer_list_view.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/brewery/Brewery.dart';
import 'package:brewed/ui/home/settings_menu_popup.dart';
import 'package:flutter/material.dart';

import 'brewery_info.dart';

class BreweryPage extends StatefulWidget {
  final Brewery _brewery;
  BreweryPage(this._brewery);


  @override
  _BreweryPageState createState() => _BreweryPageState(_brewery);
}

class _BreweryPageState extends State<BreweryPage> {
  final Brewery _brewery;
  List<Beer> _beers;
  bool _loading = true;
  _BreweryPageState(this._brewery){
    getBeerList(_brewery.name).then((beers) => setState(() {
      _beers = beers;
      _loading = false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SettingsMenuPopup()
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                child: BreweryInfo(_brewery)),
            Divider(),
            _loading ? CircularProgressIndicator() : Expanded(
                flex: 2,
                child: BeerListView(_beers)
            )
          ],
        ),
      ),
    );

  }


  Future<List<Beer>> getBeerList(breweryId) async{
    return await DB.selectBeersByBrewery(breweryId);
}

}

