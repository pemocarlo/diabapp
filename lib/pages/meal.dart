import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:diabapp/widgets/index.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
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
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: _image == null
                    ? Center(
                        child: Text(
                          "empty image",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      )
                    : Image.file(
                        _image,
                      ),
              ),
              Container(
                padding: new EdgeInsets.all(16.0),
              ),
              DropdownMenu(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo)),
    );
  }
}
