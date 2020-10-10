import 'file:///C:/Users/Foczka/AndroidStudioProjects/brewed/lib/ui/Constants.dart';
import 'package:flutter/material.dart';

class settingsMenuPopup extends StatelessWidget {



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
        }
    );
  }
}
