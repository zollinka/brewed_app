import 'package:flutter/material.dart';

class BreweryInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Image.network("https://icon-library.com/images/beer-bottle-icon/beer-bottle-icon-6.jpg"),
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RichText(
                    text: TextSpan(
                        text: "Brewery name",
                        style: Theme.of(context).textTheme.headline6
                    )),
              ),
              Expanded(child: Text("Brewery address")),
              Expanded(child: Text("Very very very long brewery description")),
            ],
          ),
        )
      ],
    );
  }
}
