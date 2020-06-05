import 'package:flutter/material.dart';
import 'package:diabapp/pages/home.dart';
import 'package:diabapp/pages/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => Home(),
        '/meal': (BuildContext context) => Meal(),
      }
    );
  }
}
