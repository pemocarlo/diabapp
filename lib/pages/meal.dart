import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:diabapp/widgets/menu.dart';

class Meal extends StatefulWidget {
  @override
  _MealState createState() => _MealState();
}

class _MealState extends State<Meal> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        title: Text("Meals"),
      ),
      body: Stack(children: <Widget>[
        Center(
          child: _image == null
              ? Text(
                  "empty image",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              : Image.file(_image),
        ),
        Menu(),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo)),
    );
  }
}
