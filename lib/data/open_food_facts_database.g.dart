// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_food_facts_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FoodInformation extends DataClass implements Insertable<FoodInformation> {
  final int code;
  final String title;
  final String productName;
  final String quantity;
  final String brands;
  final String categoriesEn;
  final double energy_100g;
  final double carbohydrates_100g;
  final double sugars_100g;
  final double proteins_100g;
  FoodInformation(
      {@required this.code,
      @required this.title,
      @required this.productName,
      @required this.quantity,
      @required this.brands,
      @required this.categoriesEn,
      @required this.energy_100g,
      @required this.carbohydrates_100g,
      @required this.sugars_100g,
      @required this.proteins_100g});
  factory FoodInformation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return FoodInformation(
      code: intType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
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
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
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

  factory FoodInformation.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FoodInformation(
      code: serializer.fromJson<int>(json['code']),
      title: serializer.fromJson<String>(json['title']),
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
      'title': serializer.toJson<String>(title),
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

  FoodInformation copyWith(
          {int code,
          String title,
          String productName,
          String quantity,
          String brands,
          String categoriesEn,
          double energy_100g,
          double carbohydrates_100g,
          double sugars_100g,
          double proteins_100g}) =>
      FoodInformation(
        code: code ?? this.code,
        title: title ?? this.title,
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
    return (StringBuffer('FoodInformation(')
          ..write('code: $code, ')
          ..write('title: $title, ')
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
          title.hashCode,
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
                                      proteins_100g.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FoodInformation &&
          other.code == this.code &&
          other.title == this.title &&
          other.productName == this.productName &&
          other.quantity == this.quantity &&
          other.brands == this.brands &&
          other.categoriesEn == this.categoriesEn &&
          other.energy_100g == this.energy_100g &&
          other.carbohydrates_100g == this.carbohydrates_100g &&
          other.sugars_100g == this.sugars_100g &&
          other.proteins_100g == this.proteins_100g);
}

class FoodInformationsCompanion extends UpdateCompanion<FoodInformation> {
  final Value<int> code;
  final Value<String> title;
  final Value<String> productName;
  final Value<String> quantity;
  final Value<String> brands;
  final Value<String> categoriesEn;
  final Value<double> energy_100g;
  final Value<double> carbohydrates_100g;
  final Value<double> sugars_100g;
  final Value<double> proteins_100g;
  const FoodInformationsCompanion({
    this.code = const Value.absent(),
    this.title = const Value.absent(),
    this.productName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.brands = const Value.absent(),
    this.categoriesEn = const Value.absent(),
    this.energy_100g = const Value.absent(),
    this.carbohydrates_100g = const Value.absent(),
    this.sugars_100g = const Value.absent(),
    this.proteins_100g = const Value.absent(),
  });
  FoodInformationsCompanion.insert({
    this.code = const Value.absent(),
    @required String title,
    @required String productName,
    @required String quantity,
    @required String brands,
    @required String categoriesEn,
    @required double energy_100g,
    @required double carbohydrates_100g,
    @required double sugars_100g,
    @required double proteins_100g,
  })  : title = Value(title),
        productName = Value(productName),
        quantity = Value(quantity),
        brands = Value(brands),
        categoriesEn = Value(categoriesEn),
        energy_100g = Value(energy_100g),
        carbohydrates_100g = Value(carbohydrates_100g),
        sugars_100g = Value(sugars_100g),
        proteins_100g = Value(proteins_100g);
  static Insertable<FoodInformation> custom({
    Expression<int> code,
    Expression<String> title,
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
      if (title != null) 'title': title,
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

  FoodInformationsCompanion copyWith(
      {Value<int> code,
      Value<String> title,
      Value<String> productName,
      Value<String> quantity,
      Value<String> brands,
      Value<String> categoriesEn,
      Value<double> energy_100g,
      Value<double> carbohydrates_100g,
      Value<double> sugars_100g,
      Value<double> proteins_100g}) {
    return FoodInformationsCompanion(
      code: code ?? this.code,
      title: title ?? this.title,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
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

class $FoodInformationsTable extends FoodInformations
    with TableInfo<$FoodInformationsTable, FoodInformation> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodInformationsTable(this._db, [this._alias]);
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

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 6, maxTextLength: 50);
  }

  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  GeneratedTextColumn _productName;
  @override
  GeneratedTextColumn get productName =>
      _productName ??= _constructProductName();
  GeneratedTextColumn _constructProductName() {
    return GeneratedTextColumn('product_name', $tableName, false,
        minTextLength: 6, maxTextLength: 50);
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedTextColumn _quantity;
  @override
  GeneratedTextColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedTextColumn _constructQuantity() {
    return GeneratedTextColumn('quantity', $tableName, false,
        minTextLength: 6, maxTextLength: 50);
  }

  final VerificationMeta _brandsMeta = const VerificationMeta('brands');
  GeneratedTextColumn _brands;
  @override
  GeneratedTextColumn get brands => _brands ??= _constructBrands();
  GeneratedTextColumn _constructBrands() {
    return GeneratedTextColumn('brands', $tableName, false,
        minTextLength: 6, maxTextLength: 50);
  }

  final VerificationMeta _categoriesEnMeta =
      const VerificationMeta('categoriesEn');
  GeneratedTextColumn _categoriesEn;
  @override
  GeneratedTextColumn get categoriesEn =>
      _categoriesEn ??= _constructCategoriesEn();
  GeneratedTextColumn _constructCategoriesEn() {
    return GeneratedTextColumn('categories_en', $tableName, false,
        minTextLength: 6, maxTextLength: 50);
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
        title,
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
  $FoodInformationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'food_informations';
  @override
  final String actualTableName = 'food_informations';
  @override
  VerificationContext validateIntegrity(Insertable<FoodInformation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
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
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('brands')) {
      context.handle(_brandsMeta,
          brands.isAcceptableOrUnknown(data['brands'], _brandsMeta));
    } else if (isInserting) {
      context.missing(_brandsMeta);
    }
    if (data.containsKey('categories_en')) {
      context.handle(
          _categoriesEnMeta,
          categoriesEn.isAcceptableOrUnknown(
              data['categories_en'], _categoriesEnMeta));
    } else if (isInserting) {
      context.missing(_categoriesEnMeta);
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
  FoodInformation map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FoodInformation.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodInformationsTable createAlias(String alias) {
    return $FoodInformationsTable(_db, alias);
  }
}

abstract class _$OpenFoodFactsDataBase extends GeneratedDatabase {
  _$OpenFoodFactsDataBase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $FoodInformationsTable _foodInformations;
  $FoodInformationsTable get foodInformations =>
      _foodInformations ??= $FoodInformationsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foodInformations];
}
