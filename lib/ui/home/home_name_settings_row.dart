import 'dart:ui';

import 'package:brewed/ui/home/settings_menu_popup.dart';
import 'package:flutter/material.dart';

class NameSettingsRow extends StatefulWidget {
  @override
  _NameSettingsRowState createState() => _NameSettingsRowState();
}

class _NameSettingsRowState extends State<NameSettingsRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top:10.0),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Spacer(),
        Expanded(
          flex:3,
          child:
          Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildTabName(),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSettingsMenu()
            ],
          ),
        ),
      ],
    ));
  }


  Widget _buildTabName() => new Image.asset('lib/assets/brewed_title.png',);

  Widget _buildSettingsMenu() => SettingsMenuPopup();
}
