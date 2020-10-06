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
          Flexible(
      child:  TabBar(
            tabs: [
              Tab(icon: Icon(Icons.ac_unit)),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
          ),
          Flexible(
            child: TabBarView(
            children: [
              Tab(icon: Icon(Icons.ac_unit)),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
          )
        ],
      )
    );
  }


}
