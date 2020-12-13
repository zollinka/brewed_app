import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/brewery/Brewery.dart';
import 'package:flutter/material.dart';

class BreweryInfo extends StatelessWidget {
  Brewery _brewery;

  BreweryInfo(this._brewery);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Image.network("https://icon-library.com/images/beer-bottle-icon/beer-bottle-icon-6.jpg"),
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RichText(
                    text: TextSpan(
                        text: _brewery.name != null ? _brewery.name: Constants.noData,
                        style: Theme.of(context).textTheme.headline6
                    )),
              ),
              Expanded(child:  _brewery.address != null ? Text(_brewery.address) : Text(Constants.noData)),
              Expanded(child: _brewery.description != null ? Text(_brewery.description) : Text(Constants.noData)),
            ],
          ),
        )
      ],
    );
  }
}
