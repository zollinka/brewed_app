import 'package:brewed/db/DB.dart';
import 'package:brewed/ui/Constants.dart';
import 'package:brewed/ui/alerts/no_internet_alert.dart';
import 'package:brewed/ui/home/filter_attribute_slider.dart';
import 'package:brewed/ui/home/filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterView extends StatefulWidget {
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool _searching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text(Constants.filter)),
        body: _searching ? Center(child: CircularProgressIndicator(),) :
        SafeArea(
    child: Padding(
    padding: EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0),
    child: Column(
      children: [
        Center(child: Text(Constants.beerType),),
        Flexible(
          flex:1,
          child:
          ListView(
            children:
          Constants.beerTypes.map((String choice){
              return Container(
                child: TextButton(
                    child: Text(choice),
                    onPressed: () {_handleBeerType(context, choice);},
                ),
                width: 100.0,
                color: (Filters.beerType.contains(choice)) ? Theme.of(context).primaryColor: Theme.of(context).backgroundColor,
              );}).toList(),
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
          ),),
        Divider(),
        Center(child:Text(Constants.ibu)),
        FilterAttributeSlider(Filters.ibuMin, Filters.ibuMax, Constants.ibu, 150, _updateFilters),
        Divider(),
        Center(child:Text(Constants.alcohol_percentage)),
        FilterAttributeSlider(Filters.alcoholPercentageMin, Filters.alcoholPercentageMax, Constants.alcohol_percentage, 15, _updateFilters),
        Divider(),
        Center(child:Text(Constants.sourness)),
        FilterAttributeSlider(Filters.sournessMin, Filters.sournessMax, Constants.sourness, 100, _updateFilters),
        Divider(),
        Center(child:Text(Constants.bitterness)),
        FilterAttributeSlider(Filters.bitternessMin, Filters.bitternessMax, Constants.bitterness, 100, _updateFilters),
        Divider(),
        Center(child:Text(Constants.sweetness)),
        FilterAttributeSlider(Filters.sweetnessMin, Filters.sweetnessMax, Constants.sweetness, 100, _updateFilters),
        Divider(),
        Center(child:Text(Constants.dryness)),
        FilterAttributeSlider(Filters.drynessMin, Filters.drynessMax, Constants.dryness, 100, _updateFilters),
        Divider(),
        TextButton(onPressed: () {_searchWithFilters(context);}, child: Text(Constants.showresultsfilter)),
        //Spacer(flex: 2,)
      ],
    ))));
  }


  void _updateFilters(String attribute, RangeValues values){
    if (attribute == Constants.bitterness){
      setState(() {
        Filters.bitternessMin = values.start;
        Filters.bitternessMax = values.end;
      });
    }
    else if (attribute == Constants.dryness){
      setState(() {
        Filters.drynessMin = values.start;
        Filters.drynessMax = values.end;
      });
    }
    else if (attribute == Constants.sweetness){
      setState(() {
        Filters.sweetnessMin = values.start;
        Filters.sweetnessMax = values.end;
      });
    }
    else if (attribute == Constants.sourness){
      setState(() {
        Filters.sournessMin = values.start;
        Filters.sournessMax = values.end;
      });
    }
    else if (attribute == Constants.ibu){
      setState(() {
        Filters.ibuMin = values.start;
        Filters.ibuMax = values.end;
      });
    }
    else if (attribute == Constants.alcohol_percentage){
      setState(() {
        Filters.alcoholPercentageMin = values.start;
        Filters.alcoholPercentageMax = values.end;
      });
    }
  }

  Future <void> _searchWithFilters(context) async{
    setState(() {
      _searching = true;
    });
    try {
      var beers = await DB.getBeersFiltered();
      Navigator.pop(context, beers);
    }
    catch (_) {
      Navigator.of(context).pop();
      setState(() {
        _searching = false;
      });
      showDialog(context: context,builder: (_) => NoInternetAlert(), barrierDismissible: true);
    }
  }

  void _handleBeerType(context, choice){
    if (Filters.beerType.contains(choice)){
      setState(() {
        Filters.beerType.remove(choice);
      });
    }
    else {
      setState(() {
        Filters.beerType.add(choice);
      });
    }
  }
}
