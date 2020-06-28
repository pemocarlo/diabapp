import "package:flutter/material.dart";
import 'package:diabapp/main.dart';
import 'package:provider/provider.dart';

class PopupMenuButtonSearch extends StatefulWidget {
  @override
  _PopupMenuButtonState createState() => _PopupMenuButtonState();
}

class _PopupMenuButtonState extends State<PopupMenuButtonSearch> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SearchFilter>(
      icon: Icon(Icons.filter_list),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: SearchFilter.food,
          child: Text("Food"),
        ),
        PopupMenuItem(
          value: SearchFilter.meal,
          child: Text("Meal"),
        ),
      ],
      onSelected: (value) {
        Provider.of<MealItems>(context, listen: false).changeSearchTitle(value);
      },
      //initialValue: SearchFilter.food,
    );
  }
}
