import 'file:///C:/Users/Foczka/AndroidStudioProjects/brewed/lib/ui/Constants.dart';
import 'package:brewed/ui/home/beer_guide.dart';
import 'package:flutter/material.dart';

class SettingsMenuPopup extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return PopupMenuButton <String> (
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) {
            return Constants.options.map((String choice){
            return PopupMenuItem <String> (
                value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      onSelected:  (value) {
          value == Constants.options[0] ? _goToBeerGuide(context): _goToSettings(context);
      },
    );
  }

  void _goToBeerGuide(context){
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => BeerGuide(), //response.data.toString(),),
        ));
  }

  void _goToSettings(context){
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
      appBar: AppBar(title: Text("Beer Guide"),actions: [
        SettingsMenuPopup()
      ],),
      body: BeerGuide(),
       )));
  }
}
