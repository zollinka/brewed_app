import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/brewery/Brewery.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BreweryInfo extends StatelessWidget {
  final Brewery _brewery;

  BreweryInfo(this._brewery);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Image.asset('lib/assets/brewery.jpg'),
        ),
        VerticalDivider(),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child:Center(
                child: RichText(
                    text: TextSpan(
                        text: _brewery.name != null ? _brewery.name: Constants.noData,
                        style: Theme.of(context).textTheme.headline6
                    )),
              )),
              Expanded(child:  _brewery.address != null ? FlatButton(child: Text(_brewery.address), onPressed: () {_openAddressInMaps();},) : Text(Constants.noData)),
              Expanded(child: _brewery.description != null ?
              RichText(text: TextSpan(
                  text:_brewery.description,
                  style: Theme.of(context).textTheme.bodyText1)) : Text(Constants.noData)),
            ],
          ),
        )
      ],
    );
  }

  void _openAddressInMaps() async {
    String query = Uri.encodeComponent(_brewery.address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
    }
  }
}
