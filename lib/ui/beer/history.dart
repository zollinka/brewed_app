import 'package:brewed/LocalStorage.dart';
import 'package:brewed/ui/beer/Beer.dart';

class History{
  static Set<Beer> history = {};

  static Future<void> init() async{
    var historyList = await LocalStorage.readHistory();
    if (historyList != null) { history = historyList.toSet();}
  }



  static void addToHistory(Beer beer) async{
    var historyList = history.toList();
    historyList.insert(0,beer);
    if (historyList.length > 5){
      for (var i = 5; i < historyList.length; i ++){
        historyList.removeAt(i);
      }

    }
    history = historyList.toSet();
    LocalStorage.writeHistory(history.toList());

  }

  static void removeFromHistory(Beer beer){
    history.remove(beer);
    LocalStorage.writeHistory(history.toList());
  }

}