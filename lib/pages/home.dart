import 'package:diabapp/widgets/index.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _currentBodyWidget = DashBoard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      appBar: AppBar(title: Text("Dashboard")),
      body: _currentBodyWidget,
      drawer: MainDrawer(onTap: (bodyWidget, ctx) {
        setState(() {
          _currentBodyWidget = bodyWidget;
          Navigator.pop(ctx);
        });
      }),
    );
  }
}
