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
      child: Column(
        children: <Widget>[
          Expanded(
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
                  leading: Icon(Icons.dashboard),
                  title: Text("Dashboard",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  onTap: () {
                    onTap(DashBoard(), context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.data_usage),
                  title: Text(
                    'Graphs',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  onTap: () {
                    onTap(Graphs(), context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.schedule),
                  title: Text("Schedule",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  onTap: () {
                    onTap(Schedule(), context);
                  },
                ),
                // ListTile(
                //   title: Text("Database viewer",
                //       style: TextStyle(color: Colors.black, fontSize: 18)),
                //   onTap: () {
                //     final database =
                //         Provider.of<OpenFoodFactsDataBase>(context, listen: false);
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => MoorDbViewer(database)));
                //   },
                // ),
                ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text("New meal",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  onTap: () {
                    Navigator.pushNamed(context, "/search");
                  },
                ),
              ],
            ),
          ),
          // This container holds the align
          Container(
            // This align moves the children to the bottom
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              // This container holds all the children that will be aligned
              // on the bottom and should not scroll with the above ListView
              child: Container(
                child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text('About'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
