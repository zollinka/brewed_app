import 'dart:convert';
import 'dart:io';

import 'package:brewed/ui/beer/Beer.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  static Future<String> get _localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
  static Future<File> get _localFileFavourites async {
    final path = await _localPath;
    return File('$path/beers.txt');
  }
  static Future<File> writeFavourites(List<Beer> beers) async{
    final file = await _localFileFavourites;
    final beersMapped = beers.map((beer) => beer.toMapWithBrewery()).toList();
    final beersJson = json.encode(beersMapped);
    return file.writeAsString(beersJson);
  }
  static Future<List<Beer>> readFavourites() async {
    try{
      final file = await _localFileFavourites;

      String contents = await file.readAsString();
      final beersJson = jsonDecode(contents);
      return Beer.listFromMapWithBrewery(beersJson);
    }
    catch(e){
      return null;
    }
  }

  static Future<File> get _localFileHistory async {
    final path = await _localPath;
    return File('$path/beershistory.txt');
  }

  static Future<File> writeHistory(List<Beer> beers) async{
    final file = await _localFileHistory;
    final beersMapped = beers.map((beer) => beer.toMapWithBrewery()).toList();
    final beersJson = json.encode(beersMapped);
    return file.writeAsString(beersJson);
  }

  static Future<List<Beer>> readHistory() async {
    try{
      final file = await _localFileHistory;

      String contents = await file.readAsString();
      final beersJson = jsonDecode(contents);
      return Beer.listFromMapWithBrewery(beersJson);
    }
    catch(e){
      return null;
    }
  }
}