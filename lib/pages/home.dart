import 'package:diabapp/widgets/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:diabapp/widgets/dashboard.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      appBar: AppBar(title: Text("Dashboard")),
      body: DashBoard(),
      drawer: MainDrawer(),
    );
  }
}
