import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'favorite.foods.g.dart';

class FavoriteFoods extends Table {
  TextColumn get idCategory => text().nullable()();
  TextColumn get strCategory => text().nullable()();
  TextColumn get strCategoryThumb => text().nullable()();
  TextColumn get strCategoryDescription => text().nullable()();
}

@DriftDatabase(tables: [FavoriteFoods])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<List<FavoriteFood>> getFavoriteFoods() async {
    return await select(favoriteFoods).get();
  }

  Future saveFavoriteFood(FavoriteFood food) async {
    await into(favoriteFoods).insert(food);
    var data = await select(favoriteFoods).get();
    log(data.toString());
    log("Success Add");
  }

  Future deleteFavoriteFood(FavoriteFood food) async {
    await delete(favoriteFoods).delete(food);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dataSource = await getApplicationDocumentsDirectory();
    final file = File(p.join(dataSource.path, 'favorite.foods.db'));
    return NativeDatabase(file);
  });
}
