import 'package:diabapp/services/barcode_scan.dart';
import 'package:diabapp/widgets/data_search_bar.dart';
import 'package:diabapp/widgets/popupMenu.dart';
import 'package:flutter/material.dart';
import 'package:diabapp/data/open_food_facts_database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:diabapp/main.dart';

class FoodSearch extends StatefulWidget {
  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Consumer<MealItems>(
          builder: (context, myMeal, child) {
            return AppBar(
              title: Text(myMeal.searchTitle),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    final database = Provider.of<OpenFoodFactsDataBase>(context,
                        listen: false);
                    var queryDB;
                    Function title;
                    Function subtitle;
                    SearchDelegate<dynamic> delegate;
                    var onTap;
                    switch (Provider.of<MealItems>(context, listen: false)
                        .searchType) {
                      case SearchFilter.food:
                        queryDB = database.containsValue;
                        title = (List<Foodinfo> list, index) =>
                            list[index].productName;
                        subtitle =
                            (List<Foodinfo> list, index) => list[index].brands;
                        onTap = (List<Foodinfo> myList, index) =>
                            Provider.of<MealItems>(context, listen: false)
                                .addFoodItem(myList[index]);
                        delegate = DataSearch<Foodinfo>(
                            queryDB, title, subtitle, onTap,
                            initialSuggestions: database.watchAllTasks);
                        break;
                      case SearchFilter.meal:
                        queryDB = database.watchMealContains;
                        title = (List<MealWithFoodItems> list, index) =>
                            list[index].meal.name;
                        subtitle = (List<MealWithFoodItems> list, index) =>
                            list[index].meal.name;
                        onTap = (List<MealWithFoodItems> list, index) {
                          Provider.of<MealItems>(context, listen: false)
                              .replaceFoodList(list[index].foodItems);
                        };
                        delegate = DataSearch<MealWithFoodItems>(
                            queryDB, title, subtitle, onTap,
                            initialSuggestions: database.watchAllMeals);
                        break;
                      default:
                    }
                    showSearch(context: context, delegate: delegate);
                  },
                ),
                PopupMenuButtonSearch(),
                IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    var foodItem = scan().then((value) =>
                        Provider.of<OpenFoodFactsDataBase>(context,
                                listen: false)
                            .getCode(value.rawContent));
                    foodItem.then((value) => value != null
                        ? Provider.of<MealItems>(context, listen: false)
                            .addFoodItem(value)
                        : print("Not found"));
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: FoodList()),
          TextAndIconButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Pick Image',
        child: Icon(Icons.add),
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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.restaurant,
                      // size: 50.0,
                    ),
                    title: Text(myMeal.foodItems[index].myItem.productName ??
                        "undefined"),
                    subtitle: Text(myMeal.foodItems[index].myItem.brands ??
                        "Unknown brand"),
                  ),
                ),
                myMeal.foodItems[index].portions != 0.5
                    ? IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () =>
                            myMeal.changePortion(index, "decrement"),
                      )
                    : Container(),
                Consumer<MealItems>(
                  builder: (context, myMeal, child) {
                    return Column(
                      children: <Widget>[
                        Text(myMeal.foodItems[index].portions.toString()),
                        Text(
                            myMeal.foodItems[index].quantity.toString() + " g"),
                      ],
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => myMeal.changePortion(index, "increment"),
                ),
              ],
            ),
          ),
        ),
        itemCount: myMeal.foodItems.length,
      );
    });
  }
}

class TextAndIconButton extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    var foodDb = Provider.of<OpenFoodFactsDataBase>(context, listen: false);
    var fooditems = Provider.of<MealItems>(context, listen: false).foodItems;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter name for your meal"),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "My meal"),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('SAVE'),
                onPressed: () {
                  Provider.of<MealItems>(context, listen: false).mealName =
                      _textFieldController.text;
                  foodDb
                      .createEmptyMeal(_textFieldController.text)
                      .then((value) {
                    value.foodItems = fooditems;
                    foodDb.writeMeal(value);
                  });
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
