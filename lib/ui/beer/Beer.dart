import 'package:brewed/ui/brewery/Brewery.dart';

class Beer {
  String id;
  String name;
  double alcoholPercentage;
  double temperature;
  double ibu;
  double sweetness;
  double dryness;
  double sourness;
  double bitterness;
  String note;
  String beerType;
  String barCode;
  Brewery brewery;
  double rating;


  Beer.fromJson(Map json){
      id = json['id'];
      name = json['name'];
      brewery = Brewery.fromJson(json['brewery']);
      beerType = (json['beerType'] != null)? json['beerType']['type'] : null;
      alcoholPercentage = json['alcoholPercentage'];
      note = (json['beerNote'] != null) ? json['beerNote']['note']: null;
      barCode = json['barCode'];
      ibu = json['ibu'];
  }

  Beer.fromMap(Map json){
    id = json['id'];
    name = json['name'];
    brewery = Brewery(json['breweryId'], json['breweryName'], json['address'], json['description']);
    beerType = json['beerType'];
    alcoholPercentage = json['alcoholPercentage'];
    note = json['note'];
    barCode = json['barCode'];
    ibu = json['ibu'];
  }

  Beer.fromMapWithBrewery(Map json){
    id = json['id'];
    name = json['name'];
    brewery = Brewery(json['breweryId'], json['breweryName'], json['breweryAddress'], json['breweryDescription']);
    beerType = json['beerType'];
    alcoholPercentage = json['alcoholPercentage'];
    note = json['note'];
    barCode = json['barCode'];
    ibu = json['ibu'];
  }

  Map<String, dynamic> toMap() {
    var breweryId = (brewery.id != null) ? brewery.id: null;
    return {
      'id': id,
      'name': name,
      'alcoholPercentage': alcoholPercentage,
      'temperature': temperature,
      'ibu': ibu,
      'sweetness': sweetness,
      'dryness': dryness,
      'sourness': sourness,
      'bitterness': bitterness,
      'note': note,
      'beerType': beerType,
      'barCode': barCode,
      'breweryId': breweryId,
    };
  }

  Map<String, dynamic> toMapWithBrewery() {
    var breweryId = (brewery.id != null) ? brewery.id: null;
    var breweryName = (brewery.name != null) ? brewery.name: null;
    var breweryAddress = (brewery.address != null) ? brewery.address: null;
    var breweryDesc = (brewery.description != null) ? brewery.description: null;
    return {
      'id': id,
      'name': name,
      'alcoholPercentage': alcoholPercentage,
      'temperature': temperature,
      'ibu': ibu,
      'sweetness': sweetness,
      'dryness': dryness,
      'sourness': sourness,
      'bitterness': bitterness,
      'note': note,
      'beerType': beerType,
      'barCode': barCode,
      'breweryId': breweryId,
      'breweryName': breweryName,
      'breweryAddress': breweryAddress,
      'breweryDescription': breweryDesc
    };
  }

  Beer update(Map json) {
    this.sourness = json['sour'];
    this.sweetness = json['sweetness'];
    this.dryness = json['dryness'];
    this.bitterness = json['bitterness'];
    this.rating = json['score'] * 5;
    return this;
  }

  static List<Beer> listFromJson(List<dynamic> responseBody){
    return responseBody.map<Beer>((json) => Beer.fromJson(json)).toList();
  }

  static List<Beer> listFromMap(List<dynamic> responseBody){
    return responseBody.map<Beer>((json) => Beer.fromMap(json)).toList();
  }

  static List<Beer> listFromMapWithBrewery(List<dynamic> responseBody){
    return responseBody.map<Beer>((json) => Beer.fromMapWithBrewery(json)).toList();
  }

  @override
  String toString() {
    return 'Beer {"id: $id, name: $name, barcode: $barCode}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Beer &&
          //runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}