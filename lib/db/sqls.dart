// ignore: camel_case_types
class Sqls{
  static const String createTableBeer =
      "CREATE TABLE beer("
      "id TEXT PRIMARY KEY,"
      " name TEXT,"
      " alcoholPercentage REAL,"
      " temperature REAL,"
      " ibu REAL,"
      " amountOfHead REAL,"
      " malt REAL,"
      " hops REAL,"
      " yeast REAL,"
      " diacetyl REAL,"
      " sweetness REAL,"
      " dryness REAL,"
      " sourness REAL,"
      " bitterness REAL,"
      " fruitIntensity REAL,"
      " fruit TEXT,"
      " color TEXT,"
      " clarity REAL,"
      " beerType TEXT,"
      " barCode TEXT,"
      " breweryId TEXT)";

  static const String createTableBrewery =
      "CREATE TABLE brewery("
      "breweryId TEXT PRIMARY KEY,"
      " breweryName TEXT,"
      " address TEXT,"
      " description TEXT)";

  static const String createTableRating =
      "CREATE TABLE rating("
      "beerId TEXT PRIMARY KEY,"
      "rating REAL NOT NULL,"
      "dry REAL,"
      "bitter REAL,"
      "sour REAL,"
      "sweet REAL,"
      "fruit TEXT)";

  static const String selectBeerWithBrewery =
      "SELECT *"
      " FROM beer"
      " JOIN brewery"
      " USING(breweryId)";

  static const String selectBeerByBrewery =
      "SELECT *"
      " FROM beer"
      " JOIN brewery"
      " USING(breweryId)"
      " WHERE breweryName = ?";

  static const String searchBeerName =
      "SELECT *"
      " FROM beer"
      " JOIN brewery"
      " USING(breweryId)"
      " WHERE name LIKE ?";

  static const String searchBeerBarCode =
      "SELECT *"
      " FROM beer"
      " JOIN brewery"
      " USING(breweryId)"
      " WHERE barCode LIKE ?";

  static const String searchBeerBreweryName =
      "SELECT *"
      " FROM beer"
      " JOIN brewery"
      " USING(breweryId)"
      " WHERE breweryName LIKE ?";

  static const String selectBeerByBarCode =
      "SELECT *"
      " FROM beer"
      " JOIN brewery"
      " USING(breweryId)"
      " WHERE barCode = ?";
  static const String selectRatingByBeer =
      "SELECT *"
      " FROM rating"
      " WHERE beerId = ?";

}