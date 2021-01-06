import 'package:brewed/ui/beer/beer_page.dart';
import 'package:brewed/ui/home/home_name_settings_row.dart';
import 'package:brewed/ui/home/home_tabs_widget.dart';
import 'package:brewed/ui/home/photo_capture_view.dart';
import 'package:camera/camera.dart';
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
        minimum: EdgeInsets.only(top:10.0, bottom:10.0),
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
        elevation: 20.0,
        hoverElevation: 5.0,
        highlightElevation: 5.0,
        focusElevation: 5.0,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }

  Widget _buildNameSettingsRow() => Expanded(
      flex: 1,
      //fit: FlexFit.tight,
      child:NameSettingsRow());

  Widget _buildTabsWidget() => Expanded(
      flex: 9,
      //fit: FlexFit.tight,
      child: TabsWidget());

  Future<void> _goToCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PhotoCaptureView(camera: firstCamera,))
    );
  }
}