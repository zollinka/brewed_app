import 'dart:convert';

class Filters {
  static double ibuMin = 0;
  static double ibuMax = 150;
  static double alcoholPercentageMin = 0;
  static double alcoholPercentageMax = 15;
  static double bitternessMin = 0;
  static double bitternessMax = 100;
  static double drynessMin = 0;
  static double drynessMax = 100;
  static double sournessMin = 0;
  static double sournessMax = 100;
  static double sweetnessMin = 0;
  static double sweetnessMax = 100;
  static Set<String> beerType = {};

  static Map<String, dynamic> toMap() {
    Map<String, dynamic> mapF = {};
    var alcoholPercentage = (alcoholPercentageMin > 0 || alcoholPercentageMax < 15) ? {'alcoholPercentageRange':{'min': alcoholPercentageMin/100, 'max': alcoholPercentageMax/100}} : null;
    var ibu =  (ibuMin > 0 || ibuMax < 150) ? {'ibu': {'min': ibuMin.toInt(), 'max': ibuMax.toInt()} }: null;
    var bitterness = (bitternessMin > 0 || bitternessMax < 100) ? {'bitterness': {'min': bitternessMin/100, 'max': bitternessMax/100}}: null;
    var dryness = (drynessMin > 0 || drynessMax < 100) ? {'dryness': {'min': drynessMin/100, 'max': drynessMax/100}}: null;
    var sourness = (sournessMin > 0 || sournessMax < 100) ? {'sourness': {'min': sournessMin/100,'max': sournessMax/100}}: null;
    var sweetness =(sweetnessMin > 0 || sweetnessMax < 100) ? {'sweetness':{'min': sweetnessMin/100, 'max': sweetnessMax/100}}: null;
    var beerTypes = (beerType.length > 0) ? {'beerTypes' : beerType.toList()}: null;
    var lll= [alcoholPercentage, ibu, bitterness, dryness, sweetness, sourness, beerTypes];
    for (final f in lll){
      if(f != null){
        mapF.addAll(f);
      }
    }
    return mapF;
  }
}