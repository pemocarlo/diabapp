import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diabapp/main.dart';

class MyDropdownFilled extends StatefulWidget {
  final List<String> dropDownValues;

  const MyDropdownFilled({Key key, @required this.dropDownValues})
      : super(key: key);

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    return dropDownValues
        .map((itemString) =>
            DropdownMenuItem(child: Text(itemString), value: itemString))
        .toList();
  }

  @override
  _MyDropdownFilledState createState() => _MyDropdownFilledState();
}

class _MyDropdownFilledState extends State<MyDropdownFilled> {
  String _activeDropdown;

  @override
  initState() {
    super.initState();
    _activeDropdown = widget.dropDownValues[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      //padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
        value: _activeDropdown,
        isDense: true,
        icon: Icon(Icons.filter_list),
        hint: null,
        onChanged: (String newValue) {
          setState(() {
            _activeDropdown = newValue;
            Provider.of<MealItems>(context, listen: false).searchType =
                _activeDropdown;
          });
        },
        items: widget.dropDownValues.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      )),
    );
  }
}
