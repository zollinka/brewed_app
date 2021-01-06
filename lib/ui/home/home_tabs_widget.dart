import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/home/favourites_tab.dart';
import 'package:brewed/ui/home/search_view.dart';
import 'package:brewed/ui/home/search_with_filters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TabsWidget extends StatefulWidget {
  @override
  _TabsWidgetState createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: Constants.browse,),
              Tab(icon: Icon(Icons.search), text: Constants.search,),
              Tab(icon: Icon(Icons.favorite), text: Constants.favorites,),
            ],
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Theme.of(context).disabledColor,
          ),

          Expanded(
            child: Padding(
            padding: EdgeInsets.only(left:20.0,right:20.0),
            child: TabBarView(
            children: [
              Tab(icon: Icon(Icons.star)),
              SearchView(),
              FavouritesTab(),


            ],
          )),
          )
        ],
      )
    );
  }


}
