import 'package:brewed/ui/home/settings_menu_popup.dart';
import 'package:flutter/material.dart';

class NameSettingsRow extends StatefulWidget {
  @override
  _NameSettingsRowState createState() => _NameSettingsRowState();
}

class _NameSettingsRowState extends State<NameSettingsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        Expanded(
          flex:8,
          child:
          Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTabName(),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              _buildSettingsMenu()
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildTabName() => new Image.asset('lib/assets/brewed_title.png', scale: 1.2,);

  Widget _buildSettingsMenu() => settingsMenuPopup();
}
