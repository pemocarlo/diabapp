import 'dart:io';

import 'package:flutter/services.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';

part 'open_food_facts_database.g.dart';

@DataClassName("Foodinfo")
class Foodinformation extends Table {
  IntColumn get code => integer()();
  TextColumn get productName => text().withLength(min: 1, max: 100)();
  TextColumn get quantity => text().withLength(min: 1, max: 100).nullable()();
  TextColumn get brands => text().withLength(min: 1, max: 100).nullable()();
  TextColumn get categoriesEn =>
      text().withLength(min: 1, max: 300).nullable()();
  RealColumn get energy_100g => real()();
  RealColumn get carbohydrates_100g => real()();
  RealColumn get sugars_100g => real()();
  RealColumn get proteins_100g => real()();

  @override
  Set<Column> get primaryKey => {code};
}

class Meals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100).nullable()();
  DateTimeColumn get timestamp => dateTime().nullable()();
  TextColumn get type => text().withLength(min: 1, max: 100).nullable()();
}

@DataClassName('MealEntry')
class MealEntries extends Table {
  IntColumn get meal => integer()();
  IntColumn get foodItem => integer()();
  IntColumn get quantity => integer().nullable()();
}

class MealWithFoodItems {
  final Meal meal;
  List<Foodinfo> foodItems;
  MealWithFoodItems(this.meal, this.foodItems);
}

@UseMoor(tables: [Foodinformation, Meals, MealEntries])
class OpenFoodFactsDataBase extends _$OpenFoodFactsDataBase {
  OpenFoodFactsDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Foodinfo>> getAllTasks() =>
      (select(foodinformation)..limit(20)).get();

  Future<List<Foodinfo>> getValue(String value) =>
      (select(foodinformation)..where((t) => t.productName.contains(value)))
          .get();

  Future<Foodinfo> getCode(String value) =>
      (select(foodinformation)..where((t) => t.code.equals(int.parse(value))))
          .getSingle();

  Stream<List<Foodinfo>> watchAllTasks() =>
      (select(foodinformation)..limit(20)).watch();

  Future<void> writeMeal(MealWithFoodItems entry) {
    return transaction(() async {
      final meal = entry.meal;

      await into(meals).insert(meal, mode: InsertMode.replace);

      await (delete(mealEntries)..where((entry) => entry.meal.equals(meal.id)))
          .go();

      for (final item in entry.foodItems) {
        await into(mealEntries).insert(MealEntry(
          meal: meal.id,
          foodItem: item.code,
          quantity: 1,
        ));
      }
    });
  }

  Future<MealWithFoodItems> createEmptyMeal() async {
    final id = await into(meals).insert(const MealsCompanion());
    final cart = Meal(id: id, name: "test");
    // we set the items property to [] because we've just created the Meal - it will be empty
    print("empty meal created");
    return MealWithFoodItems(cart, []);
  }

  Stream<MealWithFoodItems> watchMeal(int id) {
    final mealQuery = select(meals)..where((meal) => meal.id.equals(id));

    final contentQuery = select(mealEntries).join(
      [
        innerJoin(
          foodinformation,
          foodinformation.code.equalsExp(mealEntries.foodItem),
        ),
      ],
    )..where(mealEntries.meal.equals(id));

    final cartStream = mealQuery.watchSingle();

    final contentStream = contentQuery.watch().map((rows) {
      return rows.map((row) => row.readTable(foodinformation)).toList();
    });

    return CombineLatestStream.combine2(cartStream, contentStream,
        (Meal meal, List<Foodinfo> items) {
      return MealWithFoodItems(meal, items);
    });
  }

  Stream<List<MealWithFoodItems>> watchAllMeals() {
    // start by watching all carts
    final cartStream = select(meals).watch();

    return cartStream.switchMap((carts) {
      // this method is called whenever the list of carts changes. For each
      // cart, now we want to load all the items in it.
      // (we create a map from id to cart here just for performance reasons)
      final idToCart = {for (var cart in carts) cart.id: cart};
      final ids = idToCart.keys;

      // select all entries that are included in any cart that we found
      final entryQuery = select(mealEntries).join(
        [
          innerJoin(
            foodinformation,
            foodinformation.code.equalsExp(mealEntries.foodItem),
          )
        ],
      )..where(mealEntries.meal.isIn(ids));

      return entryQuery.watch().map((rows) {
        // Store the list of entries for each cart, again using maps for faster
        // lookups.
        final idToItems = <int, List<Foodinfo>>{};

        // for each entry (row) that is included in a cart, put it in the map
        // of items.
        for (var row in rows) {
          final item = row.readTable(foodinformation);
          final id = row.readTable(mealEntries).meal;

          idToItems.putIfAbsent(id, () => []).add(item);
        }
        print("watch all meals");
        // finally, all that's left is to merge the map of carts with the map of
        // entries
        return [
          for (var id in ids)
            MealWithFoodItems(idToCart[id], idToItems[id] ?? []),
        ];
      });
    });
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'open_food_facts_germany.db'));
    // await file.delete();
    if (await file.exists()) {
      print("File exists");
    } else {
      print("File doesn't exist");
      // Make sure the parent directory exists
      try {
        await file.parent.create(recursive: true);
        print("dir created");
      } catch (_) {
        print("dir not created");
      }
      // Copy from asset
      ByteData data = await rootBundle
          .load(p.join("assets/data", "open_food_facts_germany.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await file.writeAsBytes(bytes, flush: true);
      print("File written");
    }
    return VmDatabase(file);
  });
}
