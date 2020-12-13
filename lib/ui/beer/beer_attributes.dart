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
                  Tab(icon: Icon(Icons.info)),
                  Tab(icon: Icon(Icons.local_drink)),
                  Tab(icon: Icon(Icons.person)),
                ],
              ),
            Expanded(
              child: TabBarView(
                children: [
                  TabInfo(beer),
                  TabCompound(beer),
                  TabFlavor(rating),
                ],
              ),
            )
          ],
        )
    );
  }
}
