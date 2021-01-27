import 'package:brewed/API.dart';
import 'package:brewed/db/sqls.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/brewery/Brewery.dart';
import 'package:brewed/ui/rating/Rating.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DB{
  static Future<Database> database;

  static Future<void> init() async{
    database = openDatabase(
        join(await getDatabasesPath(), 'beer_database.db'),
      onCreate: (db, version) async {
          await db.execute(Sqls.createTableBrewery);
          await db.execute(Sqls.createTableBeer);
          await db.execute(Sqls.createTableRating);
      },
      version: 1,
    );
    //final List<Beer> beers = Beer.listFromJson(await API.getBeers());
    //final Beer beer = Beer.fromJson(await API.getBeer());
    //final Rating rating = Rating.fromJson(await API.getRatingByBeer("  "));
    //await insertBeers(beers);
    //await insertBeer(beer);
    //await insertRating(rating);
  }


  static Future<void> insertBrewery(Brewery brewery) async{
    final Database db = await database;
    await db.insert(
      'brewery',
      brewery.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  static Future<void> insertBeers(List<Beer> beers) async{
    for (final beer in beers){
      insertBeer(beer);
    }
  }

  static Future<void> insertBeer(Beer beer) async{
    final Database db = await database;
    await insertBrewery(beer.brewery);
    await db.insert(
      'beer',
      beer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  static Future<void> insertRating(Rating rating) async{
    final Database db = await database;
    await db.insert(
      'rating',
      rating.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  static Future<List<Beer>> getBeers() async{
    final List<Beer> beers = Beer.listFromJson(await API.getBeers());
    final Database db = await database;
    insertBeers(beers);
    final List<Map<String, dynamic>> beersMapped = await db.rawQuery(Sqls.selectBeerWithBrewery);
    return Beer.listFromMap(beersMapped);
  }


  static Future<List<Beer>> searchBeers2(String searchString) async{
    final Database db = await database;
    searchString = "%" + searchString + "%";
    final List<Map<String, dynamic>> beersNameMapped = await db.rawQuery(Sqls.searchBeerName,[searchString]);
    final List<Map<String, dynamic>> beersBarCodeMapped = await db.rawQuery(Sqls.searchBeerBarCode,[searchString]);
    final List<Map<String, dynamic>> beersBreweryNameMapped = await db.rawQuery(Sqls.searchBeerBreweryName,[searchString]);
    var beersMapped = [...{...beersBarCodeMapped + beersNameMapped + beersBreweryNameMapped}];
    return Beer.listFromMap(beersMapped);
  }

  static Future<List<Beer>> searchBeers(String searchString) async{
    final List<Beer> beersName = Beer.listFromJson(await API.searchByName(searchString));
    insertBeers(beersName);
    final List<Beer> beersBreweryName = Beer.listFromJson(await API.searchByBreweryName(searchString));
    insertBeers(beersBreweryName);
    var beers = beersBreweryName + beersName;
    return beers.toSet().toList();
  }



  static Future<List<Beer>> selectBeersByBrewery(String breweryId) async{
    final Database db = await database;
    final List<Map<String, dynamic>> beersMapped = await db.rawQuery(Sqls.selectBeerByBrewery,[breweryId]);
    List<Beer> beers = Beer.listFromMap(beersMapped);
    return beers;
  }

  static Future<Beer> getBeerByBarCode(String barCode) async {
    final Database db = await database;
    final List<Map<String, dynamic>> beerMapped = await db.rawQuery(Sqls.selectBeerByBarCode, [barCode]);
    return Beer.fromMap(beerMapped[0]);
  }

  static Future<Rating> getRatingByBeer(String beerId) async{
    final response = await API.getRatingByBeer(beerId);
    if ( response != null){
      final Rating rating = Rating.fromMap(response);
      insertRating(rating);
      final Database db = await database;
      final List<Map<String, dynamic>> ratingsMapped = await db.rawQuery(Sqls.selectRatingByBeer, [beerId]);
      if (ratingsMapped.length != 0){
        return Rating.fromJson(ratingsMapped[0]);
      }
    }
    return null;

  }

  static Future<List<Beer>> getBeersFiltered() async{
    final List<Beer> beers = Beer.listFromJson(await API.getFilteredBeers());
    await insertBeers(beers);
    return beers;
  }

}