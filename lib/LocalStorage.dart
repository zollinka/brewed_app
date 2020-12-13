import 'dart:convert';
import 'dart:io';

import 'package:brewed/ui/beer/Beer.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  static Future<String> get _localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/beers.txt');
  }
  static Future<File> writeFavourites(List<Beer> beers) async{
    final file = await _localFile;
    final beersMapped = beers.map((beer) => beer.toMapWithBrewery()).toList();
    final beersJson = json.encode(beersMapped);
    return file.writeAsString(beersJson);
  }
  static Future<List<Beer>> readFavourites() async {
    try{
      final file = await _localFile;

      String contents = await file.readAsString();
      print(contents);
      final beersJson = jsonDecode(contents);
      print(beersJson);
      return Beer.listFromMapWithBrewery(beersJson);
    }
    catch(e){
      print(e);
      return null;
    }
  }
}