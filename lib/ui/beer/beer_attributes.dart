import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/tab_compound.dart';
import 'package:brewed/ui/beer/tab_flavor.dart';
import 'package:brewed/ui/beer/tab_info.dart';
import 'package:brewed/ui/rating/Rating.dart';
import 'package:flutter/material.dart';

class BeerAttributes extends StatelessWidget {
  final Beer beer;
  final Rating rating;

  BeerAttributes(this.beer, this.rating);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: [TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.info), text: Constants.info,),
                  Tab(icon: Icon(Icons.people), text: Constants.community,),
                  Tab(icon: Icon(Icons.person), text: Constants.myrating,),

                ],
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Theme.of(context).disabledColor,
              ),
            Expanded(
              child: Padding(
    padding: EdgeInsets.only(left:20.0,right:20.0, top: 20.0),
    child:TabBarView(
                children: [
                  TabInfo(beer),
                  TabCompound(beer),
                  TabFlavor(rating),
                ],
              ),
            )
            )],
        )
    );
  }
}
