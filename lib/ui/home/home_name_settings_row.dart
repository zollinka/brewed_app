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
      children: <Widget> [
        Flexible(
          flex:8,
          child:
          Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTabName(),
            ],
          ),
        ),
        Flexible(
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


  Widget _buildTabName() => Text(
    "brewed",
    textAlign: TextAlign.left,
  );

  Widget _buildSettingsMenu() => settingsMenuPopup();
}
