import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Dashboard",
            style: TextStyle(color: Colors.white, fontSize: 22)),
        SizedBox(height: 10),
        Text("Graphs", style: TextStyle(color: Colors.white, fontSize: 22)),
        SizedBox(height: 10),
        Text("Personal data",
            style: TextStyle(color: Colors.white, fontSize: 22)),
        SizedBox(height: 10),
        Text("Schedule",
            style: TextStyle(color: Colors.white, fontSize: 22)),
      ],
    );
  }
}
