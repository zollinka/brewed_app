import 'package:brewed/ui/beer/tab_info.dart';
import 'package:flutter/material.dart';

class BeerAtribbutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Flexible(
              child:  TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.info)),
                  Tab(icon: Icon(Icons.search)),
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.person)),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                children: [
                  TabInfo(),
                  Tab(icon: Icon(Icons.search)),
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.person)),
                ],
              ),
            )
          ],
        )
    );
  }
}
