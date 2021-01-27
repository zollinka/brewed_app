import 'package:brewed/API.dart';
import 'package:brewed/db/DB.dart';
import 'package:brewed/app/brewed_app.dart';
import 'package:brewed/ui/beer/favourites.dart';
import 'package:brewed/ui/beer/history.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await API.init();
  await DB.init();
  await Favourites.init();
  await History.init();
  runApp(BrewedApp());
}




