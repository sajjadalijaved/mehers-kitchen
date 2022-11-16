import 'package:mehers_kitchen/modelclasses/food_model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class FoodModelDbHelper {
  static Database? database;
  static Future<Database?> getDb() async {
    if (database == null) {
      database = await openDatabase(
          join(await getDatabasesPath(), FoodModelData.dbname),
          onCreate: (db, version) {
        db.execute(FoodModelData.create_table);
      }, onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion != newVersion) {
          db.execute(FoodModelData.drop_table);
          db.execute(FoodModelData.create_table);
        }
      }, version: 1);
      return Future.value(database);
    }
    return Future.value(database);
  }
}
