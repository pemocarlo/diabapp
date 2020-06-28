// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_food_facts_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Foodinfo extends DataClass implements Insertable<Foodinfo> {
  final int code;
  final String productName;
  final String quantity;
  final String brands;
  final String categoriesEn;
  final double energy_100g;
  final double carbohydrates_100g;
  final double sugars_100g;
  final double proteins_100g;
  Foodinfo(
      {@required this.code,
      @required this.productName,
      this.quantity,
      this.brands,
      this.categoriesEn,
      @required this.energy_100g,
      @required this.carbohydrates_100g,
      @required this.sugars_100g,
      @required this.proteins_100g});
  factory Foodinfo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Foodinfo(
      code: intType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      productName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name']),
      quantity: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      brands:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}brands']),
      categoriesEn: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}categories_en']),
      energy_100g: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}energy_100g']),
      carbohydrates_100g: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}carbohydrates_100g']),
      sugars_100g: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}sugars_100g']),
      proteins_100g: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}proteins_100g']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<int>(code);
    }
    if (!nullToAbsent || productName != null) {
      map['product_name'] = Variable<String>(productName);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<String>(quantity);
    }
    if (!nullToAbsent || brands != null) {
      map['brands'] = Variable<String>(brands);
    }
    if (!nullToAbsent || categoriesEn != null) {
      map['categories_en'] = Variable<String>(categoriesEn);
    }
    if (!nullToAbsent || energy_100g != null) {
      map['energy_100g'] = Variable<double>(energy_100g);
    }
    if (!nullToAbsent || carbohydrates_100g != null) {
      map['carbohydrates_100g'] = Variable<double>(carbohydrates_100g);
    }
    if (!nullToAbsent || sugars_100g != null) {
      map['sugars_100g'] = Variable<double>(sugars_100g);
    }
    if (!nullToAbsent || proteins_100g != null) {
      map['proteins_100g'] = Variable<double>(proteins_100g);
    }
    return map;
  }

  factory Foodinfo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Foodinfo(
      code: serializer.fromJson<int>(json['code']),
      productName: serializer.fromJson<String>(json['productName']),
      quantity: serializer.fromJson<String>(json['quantity']),
      brands: serializer.fromJson<String>(json['brands']),
      categoriesEn: serializer.fromJson<String>(json['categoriesEn']),
      energy_100g: serializer.fromJson<double>(json['energy_100g']),
      carbohydrates_100g:
          serializer.fromJson<double>(json['carbohydrates_100g']),
      sugars_100g: serializer.fromJson<double>(json['sugars_100g']),
      proteins_100g: serializer.fromJson<double>(json['proteins_100g']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<int>(code),
      'productName': serializer.toJson<String>(productName),
      'quantity': serializer.toJson<String>(quantity),
      'brands': serializer.toJson<String>(brands),
      'categoriesEn': serializer.toJson<String>(categoriesEn),
      'energy_100g': serializer.toJson<double>(energy_100g),
      'carbohydrates_100g': serializer.toJson<double>(carbohydrates_100g),
      'sugars_100g': serializer.toJson<double>(sugars_100g),
      'proteins_100g': serializer.toJson<double>(proteins_100g),
    };
  }

  Foodinfo copyWith(
          {int code,
          String productName,
          String quantity,
          String brands,
          String categoriesEn,
          double energy_100g,
          double carbohydrates_100g,
          double sugars_100g,
          double proteins_100g}) =>
      Foodinfo(
        code: code ?? this.code,
        productName: productName ?? this.productName,
        quantity: quantity ?? this.quantity,
        brands: brands ?? this.brands,
        categoriesEn: categoriesEn ?? this.categoriesEn,
        energy_100g: energy_100g ?? this.energy_100g,
        carbohydrates_100g: carbohydrates_100g ?? this.carbohydrates_100g,
        sugars_100g: sugars_100g ?? this.sugars_100g,
        proteins_100g: proteins_100g ?? this.proteins_100g,
      );
  @override
  String toString() {
    return (StringBuffer('Foodinfo(')
          ..write('code: $code, ')
          ..write('productName: $productName, ')
          ..write('quantity: $quantity, ')
          ..write('brands: $brands, ')
          ..write('categoriesEn: $categoriesEn, ')
          ..write('energy_100g: $energy_100g, ')
          ..write('carbohydrates_100g: $carbohydrates_100g, ')
          ..write('sugars_100g: $sugars_100g, ')
          ..write('proteins_100g: $proteins_100g')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      code.hashCode,
      $mrjc(
          productName.hashCode,
          $mrjc(
              quantity.hashCode,
              $mrjc(
                  brands.hashCode,
                  $mrjc(
                      categoriesEn.hashCode,
                      $mrjc(
                          energy_100g.hashCode,
                          $mrjc(
                              carbohydrates_100g.hashCode,
                              $mrjc(sugars_100g.hashCode,
                                  proteins_100g.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Foodinfo &&
          other.code == this.code &&
          other.productName == this.productName &&
          other.quantity == this.quantity &&
          other.brands == this.brands &&
          other.categoriesEn == this.categoriesEn &&
          other.energy_100g == this.energy_100g &&
          other.carbohydrates_100g == this.carbohydrates_100g &&
          other.sugars_100g == this.sugars_100g &&
          other.proteins_100g == this.proteins_100g);
}

class FoodinformationCompanion extends UpdateCompanion<Foodinfo> {
  final Value<int> code;
  final Value<String> productName;
  final Value<String> quantity;
  final Value<String> brands;
  final Value<String> categoriesEn;
  final Value<double> energy_100g;
  final Value<double> carbohydrates_100g;
  final Value<double> sugars_100g;
  final Value<double> proteins_100g;
  const FoodinformationCompanion({
    this.code = const Value.absent(),
    this.productName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.brands = const Value.absent(),
    this.categoriesEn = const Value.absent(),
    this.energy_100g = const Value.absent(),
    this.carbohydrates_100g = const Value.absent(),
    this.sugars_100g = const Value.absent(),
    this.proteins_100g = const Value.absent(),
  });
  FoodinformationCompanion.insert({
    this.code = const Value.absent(),
    @required String productName,
    this.quantity = const Value.absent(),
    this.brands = const Value.absent(),
    this.categoriesEn = const Value.absent(),
    @required double energy_100g,
    @required double carbohydrates_100g,
    @required double sugars_100g,
    @required double proteins_100g,
  })  : productName = Value(productName),
        energy_100g = Value(energy_100g),
        carbohydrates_100g = Value(carbohydrates_100g),
        sugars_100g = Value(sugars_100g),
        proteins_100g = Value(proteins_100g);
  static Insertable<Foodinfo> custom({
    Expression<int> code,
    Expression<String> productName,
    Expression<String> quantity,
    Expression<String> brands,
    Expression<String> categoriesEn,
    Expression<double> energy_100g,
    Expression<double> carbohydrates_100g,
    Expression<double> sugars_100g,
    Expression<double> proteins_100g,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (productName != null) 'product_name': productName,
      if (quantity != null) 'quantity': quantity,
      if (brands != null) 'brands': brands,
      if (categoriesEn != null) 'categories_en': categoriesEn,
      if (energy_100g != null) 'energy_100g': energy_100g,
      if (carbohydrates_100g != null) 'carbohydrates_100g': carbohydrates_100g,
      if (sugars_100g != null) 'sugars_100g': sugars_100g,
      if (proteins_100g != null) 'proteins_100g': proteins_100g,
    });
  }

  FoodinformationCompanion copyWith(
      {Value<int> code,
      Value<String> productName,
      Value<String> quantity,
      Value<String> brands,
      Value<String> categoriesEn,
      Value<double> energy_100g,
      Value<double> carbohydrates_100g,
      Value<double> sugars_100g,
      Value<double> proteins_100g}) {
    return FoodinformationCompanion(
      code: code ?? this.code,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      brands: brands ?? this.brands,
      categoriesEn: categoriesEn ?? this.categoriesEn,
      energy_100g: energy_100g ?? this.energy_100g,
      carbohydrates_100g: carbohydrates_100g ?? this.carbohydrates_100g,
      sugars_100g: sugars_100g ?? this.sugars_100g,
      proteins_100g: proteins_100g ?? this.proteins_100g,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<int>(code.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(quantity.value);
    }
    if (brands.present) {
      map['brands'] = Variable<String>(brands.value);
    }
    if (categoriesEn.present) {
      map['categories_en'] = Variable<String>(categoriesEn.value);
    }
    if (energy_100g.present) {
      map['energy_100g'] = Variable<double>(energy_100g.value);
    }
    if (carbohydrates_100g.present) {
      map['carbohydrates_100g'] = Variable<double>(carbohydrates_100g.value);
    }
    if (sugars_100g.present) {
      map['sugars_100g'] = Variable<double>(sugars_100g.value);
    }
    if (proteins_100g.present) {
      map['proteins_100g'] = Variable<double>(proteins_100g.value);
    }
    return map;
  }
}

class $FoodinformationTable extends Foodinformation
    with TableInfo<$FoodinformationTable, Foodinfo> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodinformationTable(this._db, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedIntColumn _code;
  @override
  GeneratedIntColumn get code => _code ??= _constructCode();
  GeneratedIntColumn _constructCode() {
    return GeneratedIntColumn(
      'code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  GeneratedTextColumn _productName;
  @override
  GeneratedTextColumn get productName =>
      _productName ??= _constructProductName();
  GeneratedTextColumn _constructProductName() {
    return GeneratedTextColumn('product_name', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedTextColumn _quantity;
  @override
  GeneratedTextColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedTextColumn _constructQuantity() {
    return GeneratedTextColumn('quantity', $tableName, true,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _brandsMeta = const VerificationMeta('brands');
  GeneratedTextColumn _brands;
  @override
  GeneratedTextColumn get brands => _brands ??= _constructBrands();
  GeneratedTextColumn _constructBrands() {
    return GeneratedTextColumn('brands', $tableName, true,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _categoriesEnMeta =
      const VerificationMeta('categoriesEn');
  GeneratedTextColumn _categoriesEn;
  @override
  GeneratedTextColumn get categoriesEn =>
      _categoriesEn ??= _constructCategoriesEn();
  GeneratedTextColumn _constructCategoriesEn() {
    return GeneratedTextColumn('categories_en', $tableName, true,
        minTextLength: 1, maxTextLength: 300);
  }

  final VerificationMeta _energy_100gMeta =
      const VerificationMeta('energy_100g');
  GeneratedRealColumn _energy_100g;
  @override
  GeneratedRealColumn get energy_100g =>
      _energy_100g ??= _constructEnergy100g();
  GeneratedRealColumn _constructEnergy100g() {
    return GeneratedRealColumn(
      'energy_100g',
      $tableName,
      false,
    );
  }

  final VerificationMeta _carbohydrates_100gMeta =
      const VerificationMeta('carbohydrates_100g');
  GeneratedRealColumn _carbohydrates_100g;
  @override
  GeneratedRealColumn get carbohydrates_100g =>
      _carbohydrates_100g ??= _constructCarbohydrates100g();
  GeneratedRealColumn _constructCarbohydrates100g() {
    return GeneratedRealColumn(
      'carbohydrates_100g',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sugars_100gMeta =
      const VerificationMeta('sugars_100g');
  GeneratedRealColumn _sugars_100g;
  @override
  GeneratedRealColumn get sugars_100g =>
      _sugars_100g ??= _constructSugars100g();
  GeneratedRealColumn _constructSugars100g() {
    return GeneratedRealColumn(
      'sugars_100g',
      $tableName,
      false,
    );
  }

  final VerificationMeta _proteins_100gMeta =
      const VerificationMeta('proteins_100g');
  GeneratedRealColumn _proteins_100g;
  @override
  GeneratedRealColumn get proteins_100g =>
      _proteins_100g ??= _constructProteins100g();
  GeneratedRealColumn _constructProteins100g() {
    return GeneratedRealColumn(
      'proteins_100g',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        code,
        productName,
        quantity,
        brands,
        categoriesEn,
        energy_100g,
        carbohydrates_100g,
        sugars_100g,
        proteins_100g
      ];
  @override
  $FoodinformationTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'foodinformation';
  @override
  final String actualTableName = 'foodinformation';
  @override
  VerificationContext validateIntegrity(Insertable<Foodinfo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name'], _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    }
    if (data.containsKey('brands')) {
      context.handle(_brandsMeta,
          brands.isAcceptableOrUnknown(data['brands'], _brandsMeta));
    }
    if (data.containsKey('categories_en')) {
      context.handle(
          _categoriesEnMeta,
          categoriesEn.isAcceptableOrUnknown(
              data['categories_en'], _categoriesEnMeta));
    }
    if (data.containsKey('energy_100g')) {
      context.handle(
          _energy_100gMeta,
          energy_100g.isAcceptableOrUnknown(
              data['energy_100g'], _energy_100gMeta));
    } else if (isInserting) {
      context.missing(_energy_100gMeta);
    }
    if (data.containsKey('carbohydrates_100g')) {
      context.handle(
          _carbohydrates_100gMeta,
          carbohydrates_100g.isAcceptableOrUnknown(
              data['carbohydrates_100g'], _carbohydrates_100gMeta));
    } else if (isInserting) {
      context.missing(_carbohydrates_100gMeta);
    }
    if (data.containsKey('sugars_100g')) {
      context.handle(
          _sugars_100gMeta,
          sugars_100g.isAcceptableOrUnknown(
              data['sugars_100g'], _sugars_100gMeta));
    } else if (isInserting) {
      context.missing(_sugars_100gMeta);
    }
    if (data.containsKey('proteins_100g')) {
      context.handle(
          _proteins_100gMeta,
          proteins_100g.isAcceptableOrUnknown(
              data['proteins_100g'], _proteins_100gMeta));
    } else if (isInserting) {
      context.missing(_proteins_100gMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Foodinfo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Foodinfo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodinformationTable createAlias(String alias) {
    return $FoodinformationTable(_db, alias);
  }
}

class Meal extends DataClass implements Insertable<Meal> {
  final int id;
  final String name;
  final DateTime timestamp;
  final String type;
  Meal({@required this.id, this.name, this.timestamp, this.type});
  factory Meal.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Meal(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      timestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime>(timestamp);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    return map;
  }

  factory Meal.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Meal(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'type': serializer.toJson<String>(type),
    };
  }

  Meal copyWith({int id, String name, DateTime timestamp, String type}) => Meal(
        id: id ?? this.id,
        name: name ?? this.name,
        timestamp: timestamp ?? this.timestamp,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(timestamp.hashCode, type.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Meal &&
          other.id == this.id &&
          other.name == this.name &&
          other.timestamp == this.timestamp &&
          other.type == this.type);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> timestamp;
  final Value<String> type;
  const MealsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.type = const Value.absent(),
  });
  MealsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.type = const Value.absent(),
  });
  static Insertable<Meal> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<DateTime> timestamp,
    Expression<String> type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (timestamp != null) 'timestamp': timestamp,
      if (type != null) 'type': type,
    });
  }

  MealsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<DateTime> timestamp,
      Value<String> type}) {
    return MealsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }
}

class $MealsTable extends Meals with TableInfo<$MealsTable, Meal> {
  final GeneratedDatabase _db;
  final String _alias;
  $MealsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedDateTimeColumn _timestamp;
  @override
  GeneratedDateTimeColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedDateTimeColumn _constructTimestamp() {
    return GeneratedDateTimeColumn(
      'timestamp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, true,
        minTextLength: 1, maxTextLength: 100);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, timestamp, type];
  @override
  $MealsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'meals';
  @override
  final String actualTableName = 'meals';
  @override
  VerificationContext validateIntegrity(Insertable<Meal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp'], _timestampMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meal map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Meal.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(_db, alias);
  }
}

class MealEntry extends DataClass implements Insertable<MealEntry> {
  final int meal;
  final int foodItem;
  final double quantity;
  final double portions;
  MealEntry(
      {@required this.meal,
      @required this.foodItem,
      this.quantity,
      this.portions});
  factory MealEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return MealEntry(
      meal: intType.mapFromDatabaseResponse(data['${effectivePrefix}meal']),
      foodItem:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}food_item']),
      quantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      portions: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}portions']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || meal != null) {
      map['meal'] = Variable<int>(meal);
    }
    if (!nullToAbsent || foodItem != null) {
      map['food_item'] = Variable<int>(foodItem);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || portions != null) {
      map['portions'] = Variable<double>(portions);
    }
    return map;
  }

  factory MealEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MealEntry(
      meal: serializer.fromJson<int>(json['meal']),
      foodItem: serializer.fromJson<int>(json['foodItem']),
      quantity: serializer.fromJson<double>(json['quantity']),
      portions: serializer.fromJson<double>(json['portions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'meal': serializer.toJson<int>(meal),
      'foodItem': serializer.toJson<int>(foodItem),
      'quantity': serializer.toJson<double>(quantity),
      'portions': serializer.toJson<double>(portions),
    };
  }

  MealEntry copyWith(
          {int meal, int foodItem, double quantity, double portions}) =>
      MealEntry(
        meal: meal ?? this.meal,
        foodItem: foodItem ?? this.foodItem,
        quantity: quantity ?? this.quantity,
        portions: portions ?? this.portions,
      );
  @override
  String toString() {
    return (StringBuffer('MealEntry(')
          ..write('meal: $meal, ')
          ..write('foodItem: $foodItem, ')
          ..write('quantity: $quantity, ')
          ..write('portions: $portions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(meal.hashCode,
      $mrjc(foodItem.hashCode, $mrjc(quantity.hashCode, portions.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MealEntry &&
          other.meal == this.meal &&
          other.foodItem == this.foodItem &&
          other.quantity == this.quantity &&
          other.portions == this.portions);
}

class MealEntriesCompanion extends UpdateCompanion<MealEntry> {
  final Value<int> meal;
  final Value<int> foodItem;
  final Value<double> quantity;
  final Value<double> portions;
  const MealEntriesCompanion({
    this.meal = const Value.absent(),
    this.foodItem = const Value.absent(),
    this.quantity = const Value.absent(),
    this.portions = const Value.absent(),
  });
  MealEntriesCompanion.insert({
    @required int meal,
    @required int foodItem,
    this.quantity = const Value.absent(),
    this.portions = const Value.absent(),
  })  : meal = Value(meal),
        foodItem = Value(foodItem);
  static Insertable<MealEntry> custom({
    Expression<int> meal,
    Expression<int> foodItem,
    Expression<double> quantity,
    Expression<double> portions,
  }) {
    return RawValuesInsertable({
      if (meal != null) 'meal': meal,
      if (foodItem != null) 'food_item': foodItem,
      if (quantity != null) 'quantity': quantity,
      if (portions != null) 'portions': portions,
    });
  }

  MealEntriesCompanion copyWith(
      {Value<int> meal,
      Value<int> foodItem,
      Value<double> quantity,
      Value<double> portions}) {
    return MealEntriesCompanion(
      meal: meal ?? this.meal,
      foodItem: foodItem ?? this.foodItem,
      quantity: quantity ?? this.quantity,
      portions: portions ?? this.portions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (meal.present) {
      map['meal'] = Variable<int>(meal.value);
    }
    if (foodItem.present) {
      map['food_item'] = Variable<int>(foodItem.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (portions.present) {
      map['portions'] = Variable<double>(portions.value);
    }
    return map;
  }
}

class $MealEntriesTable extends MealEntries
    with TableInfo<$MealEntriesTable, MealEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $MealEntriesTable(this._db, [this._alias]);
  final VerificationMeta _mealMeta = const VerificationMeta('meal');
  GeneratedIntColumn _meal;
  @override
  GeneratedIntColumn get meal => _meal ??= _constructMeal();
  GeneratedIntColumn _constructMeal() {
    return GeneratedIntColumn(
      'meal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _foodItemMeta = const VerificationMeta('foodItem');
  GeneratedIntColumn _foodItem;
  @override
  GeneratedIntColumn get foodItem => _foodItem ??= _constructFoodItem();
  GeneratedIntColumn _constructFoodItem() {
    return GeneratedIntColumn(
      'food_item',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedRealColumn _quantity;
  @override
  GeneratedRealColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedRealColumn _constructQuantity() {
    return GeneratedRealColumn(
      'quantity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _portionsMeta = const VerificationMeta('portions');
  GeneratedRealColumn _portions;
  @override
  GeneratedRealColumn get portions => _portions ??= _constructPortions();
  GeneratedRealColumn _constructPortions() {
    return GeneratedRealColumn(
      'portions',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [meal, foodItem, quantity, portions];
  @override
  $MealEntriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'meal_entries';
  @override
  final String actualTableName = 'meal_entries';
  @override
  VerificationContext validateIntegrity(Insertable<MealEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meal')) {
      context.handle(
          _mealMeta, meal.isAcceptableOrUnknown(data['meal'], _mealMeta));
    } else if (isInserting) {
      context.missing(_mealMeta);
    }
    if (data.containsKey('food_item')) {
      context.handle(_foodItemMeta,
          foodItem.isAcceptableOrUnknown(data['food_item'], _foodItemMeta));
    } else if (isInserting) {
      context.missing(_foodItemMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    }
    if (data.containsKey('portions')) {
      context.handle(_portionsMeta,
          portions.isAcceptableOrUnknown(data['portions'], _portionsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MealEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MealEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MealEntriesTable createAlias(String alias) {
    return $MealEntriesTable(_db, alias);
  }
}

abstract class _$OpenFoodFactsDataBase extends GeneratedDatabase {
  _$OpenFoodFactsDataBase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $FoodinformationTable _foodinformation;
  $FoodinformationTable get foodinformation =>
      _foodinformation ??= $FoodinformationTable(this);
  $MealsTable _meals;
  $MealsTable get meals => _meals ??= $MealsTable(this);
  $MealEntriesTable _mealEntries;
  $MealEntriesTable get mealEntries => _mealEntries ??= $MealEntriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [foodinformation, meals, mealEntries];
}
