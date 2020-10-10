import 'package:brewed/ui/beer/beer_page.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            _goToCamera();
        },
        child: Icon(Icons.camera_alt),
      )
    );
  }

  Widget _buildNameSettingsRow() => Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child:NameSettingsRow());

  Widget _buildTabsWidget() => Flexible(
      flex: 14,
      fit: FlexFit.loose,
      child: TabsWidget());

  void _goToCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BeerPage())
    );
  }
}