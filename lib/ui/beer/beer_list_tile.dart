import 'package:flutter/material.dart';

class BeerListTile extends StatelessWidget {
  final String beer;

  BeerListTile({this.beer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          beer,
          style: Theme.of(context).textTheme.bodyText2,
        )
    );
  }
}
