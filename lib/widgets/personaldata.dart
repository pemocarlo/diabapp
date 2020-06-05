import 'package:flutter/material.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Personal Data",
      style: TextStyle(color: Colors.white, fontSize: 25),
    ));
  }
}
