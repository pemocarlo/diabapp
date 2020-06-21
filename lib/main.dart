import 'package:flutter/material.dart';
import 'package:diabapp/pages/home.dart';
import 'package:diabapp/pages/meal.dart';
import 'package:diabapp/pages/searching.dart';
import 'package:provider/provider.dart';
import 'data/open_food_facts_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<OpenFoodFactsDataBase>(
      create: (context) => OpenFoodFactsDataBase(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/home',
          routes: {
            '/home': (BuildContext context) => Home(),
            '/meal': (BuildContext context) => Meal(),
            '/search': (BuildContext context) => Searching(),
          }),
    );
  }
}
