class Beer {
  String name;
  double alcoholPercentege;
  double temperature;
  int ibu;
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

  Beer(
      this.name,
      /*this.alcoholPercentege,
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
  Beer.fromJson(Map json):
      name = json['name'],
      barCode = json['barcode'],
      ibu = json['ibu'];
}