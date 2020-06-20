import 'package:flutter/material.dart';
import 'package:diabapp/widgets/index.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('DiabApp'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text("Dashboard",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            onTap: () {
              onTap(DashBoard(), context);
            },
          ),
          ListTile(
            title: Text(
              'Graphs',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              onTap(Graphs(), context);
            },
          ),
          ListTile(
            title: Text("Personal Data",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            title: Text("Schedule",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            onTap: () {
              onTap(Foods(), context);
            },
          ),
        ],
      ),
    );
  }
}
