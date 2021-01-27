import 'package:brewed/LocalStorage.dart';
import 'package:brewed/ui/beer/Beer.dart';

class Favourites{
  static Set<Beer> favourites = {};

  static Future<void> init() async{
    var favouritesList = await LocalStorage.readFavourites();
    if (favouritesList != null) { favourites = favouritesList.toSet();}
  }



  static void addFavourite(Beer beer) async{
    favourites.add(beer);
    LocalStorage.writeFavourites(favourites.toList());

  }

  static void removeFavourite(Beer beer){
    favourites.remove(beer);
    LocalStorage.writeFavourites(favourites.toList());
  }

  static bool isFavourite(Beer beer){
    return favourites.contains(beer);
  }
}