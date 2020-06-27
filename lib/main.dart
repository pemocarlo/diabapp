import 'package:flutter/material.dart';
import 'package:diabapp/pages/home.dart';
import 'package:diabapp/pages/meal.dart';
import 'package:diabapp/pages/food_search.dart';
import 'package:diabapp/pages/barcode.dart';
import 'package:provider/provider.dart';
import 'data/open_food_facts_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<OpenFoodFactsDataBase>(
            create: (context) => OpenFoodFactsDataBase()),
        ChangeNotifierProvider<MealItems>(create: (context) => MealItems()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/home',
          routes: {
            '/home': (BuildContext context) => Home(),
            '/meal': (BuildContext context) => MealPage(),
            '/search': (BuildContext context) => FoodSearch(),
            '/barcode': (BuildContext context) => Barcode(),
          }),
    );
  }
}

class MealItems with ChangeNotifier {
  // List<Foodinfo> foodList = [];
  List<MyFoodItem> foodItems = [];
  String mealName = "";
  String searchType = "Food";
  // void addFood(Foodinfo value) {
  //   foodList.add(value);
  //   notifyListeners();
  // }

  void addFoodItem(Foodinfo value) {
    foodItems.add(MyFoodItem(value));
    notifyListeners();
  }

  void replaceFoodList(List<MealWithFoodItems> value) {
    notifyListeners();
  }

  void removeFood(int index) {
    foodItems.removeAt(index);
    notifyListeners();
  }

  void changePortion(int index, String mode) {
    switch (mode) {
      case "increment":
        foodItems[index].portions += 0.5;
        break;
      case "decrement":
        foodItems[index].portions -= 0.5;
        break;
      default:
    }

    notifyListeners();
  }
}

// class MyFoodItem {
//   String productName;
//   String brands;
//   double quantityPerPortion = 100;
//   String unit = "g";
//   double portions = 1;
//   double energy_100g;
//   double sugars_100g;
//   double carbohydrates_100g;
//   double proteins_100g;

//   MyFoodItem(
//       {this.productName,
//       this.brands,
//       this.energy_100g,
//       this.sugars_100g,
//       this.carbohydrates_100g,
//       this.proteins_100g});
// }

class MyFoodItem {
  Foodinfo item;
  double portions = 1;

  MyFoodItem(this.item);
}
