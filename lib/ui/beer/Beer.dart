import 'package:brewed/ui/brewery/Brewery.dart';
import 'dart:convert';
class Beer {
  String id;
  String name;
  double alcoholPercentage;
  double temperature;
  double ibu;
  double amountOfHead;
  double malt;
  double hops;
  double yeast;
  double diacetyl;
  double sweetness;
  double dryness;
  double sourness;
  double bitterness;
  double fruitIntensity;
  String fruit;
  String color;
  double clarity;
  String beerType;
  String barCode;
  Brewery brewery;

  Beer(
      this.name,
      this.brewery
      /*this.alcoholPercentage,
      this.temperature,
      this.ibu,
      this.amountOfHead,
      this.malt,
      this.hops,
      this.yeast,
      this.diacetyl,
      this.sweetness,
      this.dryness,
      this.sourness,
      this.bitterness,
      this.fruitIntensity,
      this.fruit,
      this.color,
      this.clarity,
      this.beerType,
      this.barCode*/);
  Beer.fromJson(Map json){
      id = json['id'];
      name = json['name'];
      brewery = Brewery.fromJson(json['brewery']);
      beerType = json['beerType'];
      alcoholPercentage = json['beerAttributes']['alcoholPercentage'];
      //flavor = json['beerAttributes']['flavor'];
      barCode = (json['barCode'] != null) ? json['barCode']['barCode'] : null;
      //ibu = json['ibu'];
  }

  Beer.fromMap(Map json){
    id = json['id'];
    name = json['name'];
    brewery = Brewery(json['breweryId'], json['breweryName'], json['address'], json['description']);
    beerType = json['beerType'];
    alcoholPercentage = json['alcoholPercentage'];
    //flavor = json['beerAttributes']['flavor'];
    barCode = json['barCode'];
    //ibu = json['ibu'];
  }

  Map<String, dynamic> toMap() {
    var breweryId = (brewery.id != null) ? brewery.id: null;
    return {
      'id': id,
      'name': name,
      'alcoholPercentage': alcoholPercentage,
      'temperature': temperature,
      'ibu': ibu,
      'amountOfHead': amountOfHead,
      'malt': malt,
      'hops': hops,
      'yeast': yeast,
      'diacetyl': diacetyl,
      'sweetness': sweetness,
      'dryness': dryness,
      'sourness': sourness,
      'bitterness': bitterness,
      'fruitIntensity': fruitIntensity,
      'fruit': fruit,
      'color': color,
      'clarity': clarity,
      'beerType': beerType,
      'barCode': barCode,
      'breweryId': breweryId,
    };
  }

  static List<Beer> listFromJson(List<dynamic> responseBody){
    return responseBody.map<Beer>((json) => Beer.fromJson(json)).toList();
  }

  static List<Beer> listFromMap(List<dynamic> responseBody){
    return responseBody.map<Beer>((json) => Beer.fromMap(json)).toList();
  }

  @override
  String toString() {
    return 'Beer {"id: $id, name: $name, barcode: $barCode}';
  }
}