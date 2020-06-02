import 'package:flutter/material.dart';
import 'package:diabapp/pages/home.dart';

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
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        // '/': (BuildContext context) => Loading(),
        '/home': (BuildContext context) => Home(),
        // '/location': (BuildContext context) => Location(),
      }
    );
  }
}
