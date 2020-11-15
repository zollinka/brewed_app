import 'package:brewed/API.dart';
import 'package:brewed/db/sqls.dart';
import 'package:brewed/ui/beer/Beer.dart';
import 'package:brewed/ui/brewery/Brewery.dart';
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
      },
      version: 1,
    );
    final Beer beer = Beer.fromJson(await API.getBeer());
    await insertBeer(beer);
    await printbeers();
  }

  static Future<void> insertBrewery(Brewery brewery) async{
    final Database db = await database;
    await db.insert(
      'brewery',
      brewery.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

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

  static Future<List<Beer>> getBeers() async{
    final Database db = await database;
    final List<Map<String, dynamic>> beersMapped = await db.rawQuery(Sqls.selectBeerWithBrewery);
    print(beersMapped);
    return Beer.listFromMap(beersMapped);
  }

  static Future<void> printbeers() async{
    List<Beer> beers = await getBeers();
    print(beers[0].toString());
  }

  static Future<List<Beer>> searchBeers(String searchString) async{
    final Database db = await database;
    searchString = "%" + searchString + "%";
    final List<Map<String, dynamic>> beersNameMapped = await db.rawQuery(Sqls.searchBeerName,[searchString]);
    print(beersNameMapped);
    final List<Map<String, dynamic>> beersBarCodeMapped = await db.rawQuery(Sqls.searchBeerBarCode,[searchString]);
    var beersMapped = [...{...beersBarCodeMapped + beersNameMapped}];
    print(beersMapped);
    return Beer.listFromMap(beersMapped);
  }

}