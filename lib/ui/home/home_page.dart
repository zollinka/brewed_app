import 'package:brewed/ui/home/home_name_settings_row.dart';
import 'package:brewed/ui/home/home_tabs_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            _buildNameSettingsRow(),
            _buildTabsWidget(),
          ],
        )

      ),
    );
  }

  Widget _buildNameSettingsRow() => NameSettingsRow();

  Widget _buildTabsWidget() => TabsWidget();


}