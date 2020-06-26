import 'package:flutter/material.dart';
import 'package:diabapp/data/open_food_facts_database.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:diabapp/main.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: FoodList()),
          TextAndIconButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var foodItem = scan().then((value) =>
              Provider.of<OpenFoodFactsDataBase>(context, listen: false)
                  .getCode(value.rawContent));
          foodItem.then((value) => value != null
              ? Provider.of<MealItems>(context, listen: false).addFood(value)
              : print("Not found"));

          //then((value) => Provider.of<MealItems>(context, listen: false)
          //.addFood(value));
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.camera),
      ),
    );
  }
}

class FoodList extends StatefulWidget {
  const FoodList({
    Key key,
  }) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MealItems>(builder: (context, myMeal, child) {
      return ListView.builder(
        itemBuilder: (context, index) => Slidable(
          actionPane: SlidableDrawerActionPane(),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => myMeal.removeFood(index),
            )
          ],
          child: Card(
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.restaurant,
                size: 50.0,
              ),
              title: Text(myMeal.foodList[index].productName ?? "undefined"),
              subtitle: Text(myMeal.foodList[index].brands ?? "Unknown brand"),
            ),
          ),
        ),
        itemCount: myMeal.foodList.length,
      );
    });
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for appbar
    return <Widget>[
      query.isNotEmpty
          ? IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          : IconButton(
              icon: const Icon(Icons.mic),
              tooltip: 'Voice input',
              onPressed: () {
                this.query = 'TODO: Get input from voice';
              },
            ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show results based on the selection
    return Center(
      child: Center(
          child: Text(Provider.of<MealItems>(context).foodList[0].productName)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches

    final database = Provider.of<OpenFoodFactsDataBase>(context);
    final suggestionList = database.getValue(query);

    return FutureBuilder(
        future: suggestionList,
        builder: (context, AsyncSnapshot<List<Foodinfo>> snapshot) {
          final tasks = snapshot.data ?? List();

          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Provider.of<MealItems>(context, listen: false)
                    .addFood(tasks[index]);
                // showResults(context);
                this.close(context, null);
              },
              leading: Icon(Icons.restaurant),
              title: Text(tasks[index].productName ?? "undefined"),
              subtitle: Text(tasks[index].brands ?? "Unknown brand"),
            ),
            itemCount: tasks.length,
          );
        });
  }
}

Future<ScanResult> scan() async {
  ScanResult scanResult;

  final _flashOnController = TextEditingController(text: "Flash on");
  final _flashOffController = TextEditingController(text: "Flash off");
  final _cancelController = TextEditingController(text: "Cancel");

  var _aspectTolerance = 0.00;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  try {
    var options = ScanOptions(
      strings: {
        "cancel": _cancelController.text,
        "flash_on": _flashOnController.text,
        "flash_off": _flashOffController.text,
      },
      restrictFormat: selectedFormats,
      useCamera: _selectedCamera,
      autoEnableFlash: _autoEnableFlash,
      android: AndroidOptions(
        aspectTolerance: _aspectTolerance,
        useAutoFocus: _useAutoFocus,
      ),
    );

    var result = await BarcodeScanner.scan(options: options);

    scanResult = result;
  } on PlatformException catch (e) {
    var result = ScanResult(
      type: ResultType.Error,
      format: BarcodeFormat.unknown,
    );

    if (e.code == BarcodeScanner.cameraAccessDenied) {
      result.rawContent = 'The user did not grant the camera permission!';
    } else {
      result.rawContent = 'Unknown error: $e';
    }
    scanResult = result;
  }
  print(scanResult.rawContent ?? "");
  return scanResult;
}

class TextAndIconButton extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Name of your meal'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Meal"),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('SAVE'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton.icon(
        icon: Icon(Icons.save),
        label: Text('Save'),
        onPressed: () => _displayDialog(context),
      ),
    );
  }
}
