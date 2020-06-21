import 'dart:io';

import 'package:flutter/services.dart';
import 'package:moor/moor.dart';
// These imports are only needed to open the database
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'open_food_facts_database.g.dart';

@DataClassName("Foodinfo")
class Foodinformation extends Table {
  IntColumn get code => integer()();
  TextColumn get productName => text().withLength(min: 6, max: 50)();
  TextColumn get quantity => text().withLength(min: 6, max: 50)();
  TextColumn get brands => text().withLength(min: 6, max: 50)();
  TextColumn get categoriesEn => text().withLength(min: 6, max: 50)();
  RealColumn get energy_100g => real()();
  RealColumn get carbohydrates_100g => real()();
  RealColumn get sugars_100g => real()();
  RealColumn get proteins_100g => real()();

  @override
  Set<Column> get primaryKey => {code};
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@UseMoor(tables: [Foodinformation])
class OpenFoodFactsDataBase extends _$OpenFoodFactsDataBase {
  OpenFoodFactsDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Foodinfo>> getAllTasks() =>
      (select(foodinformation)..limit(20)).get();

  Future<List<Foodinfo>> getValue(String value) =>
      (select(foodinformation)..where((t) => t.productName.contains(value)))
          .get();
  Stream<List<Foodinfo>> watchAllTasks() =>
      (select(foodinformation)..limit(20)).watch();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'open_food_facts_germany.db'));
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
