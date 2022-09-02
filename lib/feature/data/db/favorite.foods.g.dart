// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.foods.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavoriteFood extends DataClass implements Insertable<FavoriteFood> {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;
  const FavoriteFood(
      {this.idCategory,
      this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || idCategory != null) {
      map['id_category'] = Variable<String>(idCategory);
    }
    if (!nullToAbsent || strCategory != null) {
      map['str_category'] = Variable<String>(strCategory);
    }
    if (!nullToAbsent || strCategoryThumb != null) {
      map['str_category_thumb'] = Variable<String>(strCategoryThumb);
    }
    if (!nullToAbsent || strCategoryDescription != null) {
      map['str_category_description'] =
          Variable<String>(strCategoryDescription);
    }
    return map;
  }

  FavoriteFoodsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteFoodsCompanion(
      idCategory: idCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(idCategory),
      strCategory: strCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(strCategory),
      strCategoryThumb: strCategoryThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strCategoryThumb),
      strCategoryDescription: strCategoryDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(strCategoryDescription),
    );
  }

  factory FavoriteFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteFood(
      idCategory: serializer.fromJson<String?>(json['idCategory']),
      strCategory: serializer.fromJson<String?>(json['strCategory']),
      strCategoryThumb: serializer.fromJson<String?>(json['strCategoryThumb']),
      strCategoryDescription:
          serializer.fromJson<String?>(json['strCategoryDescription']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idCategory': serializer.toJson<String?>(idCategory),
      'strCategory': serializer.toJson<String?>(strCategory),
      'strCategoryThumb': serializer.toJson<String?>(strCategoryThumb),
      'strCategoryDescription':
          serializer.toJson<String?>(strCategoryDescription),
    };
  }

  FavoriteFood copyWith(
          {Value<String?> idCategory = const Value.absent(),
          Value<String?> strCategory = const Value.absent(),
          Value<String?> strCategoryThumb = const Value.absent(),
          Value<String?> strCategoryDescription = const Value.absent()}) =>
      FavoriteFood(
        idCategory: idCategory.present ? idCategory.value : this.idCategory,
        strCategory: strCategory.present ? strCategory.value : this.strCategory,
        strCategoryThumb: strCategoryThumb.present
            ? strCategoryThumb.value
            : this.strCategoryThumb,
        strCategoryDescription: strCategoryDescription.present
            ? strCategoryDescription.value
            : this.strCategoryDescription,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteFood(')
          ..write('idCategory: $idCategory, ')
          ..write('strCategory: $strCategory, ')
          ..write('strCategoryThumb: $strCategoryThumb, ')
          ..write('strCategoryDescription: $strCategoryDescription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idCategory, strCategory, strCategoryThumb, strCategoryDescription);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteFood &&
          other.idCategory == this.idCategory &&
          other.strCategory == this.strCategory &&
          other.strCategoryThumb == this.strCategoryThumb &&
          other.strCategoryDescription == this.strCategoryDescription);
}

class FavoriteFoodsCompanion extends UpdateCompanion<FavoriteFood> {
  final Value<String?> idCategory;
  final Value<String?> strCategory;
  final Value<String?> strCategoryThumb;
  final Value<String?> strCategoryDescription;
  const FavoriteFoodsCompanion({
    this.idCategory = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strCategoryThumb = const Value.absent(),
    this.strCategoryDescription = const Value.absent(),
  });
  FavoriteFoodsCompanion.insert({
    this.idCategory = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strCategoryThumb = const Value.absent(),
    this.strCategoryDescription = const Value.absent(),
  });
  static Insertable<FavoriteFood> custom({
    Expression<String>? idCategory,
    Expression<String>? strCategory,
    Expression<String>? strCategoryThumb,
    Expression<String>? strCategoryDescription,
  }) {
    return RawValuesInsertable({
      if (idCategory != null) 'id_category': idCategory,
      if (strCategory != null) 'str_category': strCategory,
      if (strCategoryThumb != null) 'str_category_thumb': strCategoryThumb,
      if (strCategoryDescription != null)
        'str_category_description': strCategoryDescription,
    });
  }

  FavoriteFoodsCompanion copyWith(
      {Value<String?>? idCategory,
      Value<String?>? strCategory,
      Value<String?>? strCategoryThumb,
      Value<String?>? strCategoryDescription}) {
    return FavoriteFoodsCompanion(
      idCategory: idCategory ?? this.idCategory,
      strCategory: strCategory ?? this.strCategory,
      strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
      strCategoryDescription:
          strCategoryDescription ?? this.strCategoryDescription,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idCategory.present) {
      map['id_category'] = Variable<String>(idCategory.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (strCategoryThumb.present) {
      map['str_category_thumb'] = Variable<String>(strCategoryThumb.value);
    }
    if (strCategoryDescription.present) {
      map['str_category_description'] =
          Variable<String>(strCategoryDescription.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteFoodsCompanion(')
          ..write('idCategory: $idCategory, ')
          ..write('strCategory: $strCategory, ')
          ..write('strCategoryThumb: $strCategoryThumb, ')
          ..write('strCategoryDescription: $strCategoryDescription')
          ..write(')'))
        .toString();
  }
}

class $FavoriteFoodsTable extends FavoriteFoods
    with TableInfo<$FavoriteFoodsTable, FavoriteFood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteFoodsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idCategoryMeta = const VerificationMeta('idCategory');
  @override
  late final GeneratedColumn<String> idCategory = GeneratedColumn<String>(
      'id_category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  @override
  late final GeneratedColumn<String> strCategory = GeneratedColumn<String>(
      'str_category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _strCategoryThumbMeta =
      const VerificationMeta('strCategoryThumb');
  @override
  late final GeneratedColumn<String> strCategoryThumb = GeneratedColumn<String>(
      'str_category_thumb', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _strCategoryDescriptionMeta =
      const VerificationMeta('strCategoryDescription');
  @override
  late final GeneratedColumn<String> strCategoryDescription =
      GeneratedColumn<String>('str_category_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [idCategory, strCategory, strCategoryThumb, strCategoryDescription];
  @override
  String get aliasedName => _alias ?? 'favorite_foods';
  @override
  String get actualTableName => 'favorite_foods';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteFood> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_category')) {
      context.handle(
          _idCategoryMeta,
          idCategory.isAcceptableOrUnknown(
              data['id_category']!, _idCategoryMeta));
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    }
    if (data.containsKey('str_category_thumb')) {
      context.handle(
          _strCategoryThumbMeta,
          strCategoryThumb.isAcceptableOrUnknown(
              data['str_category_thumb']!, _strCategoryThumbMeta));
    }
    if (data.containsKey('str_category_description')) {
      context.handle(
          _strCategoryDescriptionMeta,
          strCategoryDescription.isAcceptableOrUnknown(
              data['str_category_description']!, _strCategoryDescriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  FavoriteFood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteFood(
      idCategory: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id_category']),
      strCategory: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}str_category']),
      strCategoryThumb: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}str_category_thumb']),
      strCategoryDescription: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}str_category_description']),
    );
  }

  @override
  $FavoriteFoodsTable createAlias(String alias) {
    return $FavoriteFoodsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $FavoriteFoodsTable favoriteFoods = $FavoriteFoodsTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteFoods];
}
