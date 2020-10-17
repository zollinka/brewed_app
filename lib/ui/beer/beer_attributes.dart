import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/beer/tab_flavor.dart';
import 'package:brewed/ui/beer/tab_info.dart';
import 'package:flutter/material.dart';

class BeerAtribbutes extends StatelessWidget {
  Beer beer;

  BeerAtribbutes(this.beer);

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
                  Tab(icon: Icon(Icons.local_drink)),
                  Tab(icon: Icon(Icons.face)),
                  Tab(icon: Icon(Icons.visibility)),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                children: [
                  TabInfo(),
                  TabFlavor(),
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
