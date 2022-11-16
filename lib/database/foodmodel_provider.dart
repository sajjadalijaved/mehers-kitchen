import 'package:mehers_kitchen/database/foodmodel_db.dart';
import 'package:mehers_kitchen/modelclasses/food_model.dart';
import 'package:sqflite/sqlite_api.dart';

class ProductDbProvider {
  Future<bool> insertData(
    FoodModelData model,
  ) async {
    Database? database = await FoodModelDbHelper.getDb();
    int result =
        await database!.insert(FoodModelData.table_name, model.toMap(model));

    if (result < 0) {
      return false;
    }
    return true;
  }

  Future<bool> updateItem(FoodModelData model) async {
    Database? database = await FoodModelDbHelper.getDb();
    int rows = await database!.update(
        FoodModelData.table_name,
        {
          FoodModelData.key_Quantity: model.quantity,
          FoodModelData.key_Price: model.price,
        },
        where: '${FoodModelData.key_ProductId} = ?',
        whereArgs: [model.productId]);
    if (rows < 0) {
      return false;
    }
    return true;
  }

  Future<bool> deleteOneItem(FoodModelData model) async {
    Database? database = await FoodModelDbHelper.getDb();
    int rows = await database!.delete(FoodModelData.table_name,
        where: '${FoodModelData.key_ProductId} = ?',
        whereArgs: [model.productId]);
    if (rows < 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> deleteAllModel() async {
    Database? database = await FoodModelDbHelper.getDb();
    int rows = await database!.delete('foodModel_tb');
    if (rows < 0) {
      return false;
    }
    return true;
  }

  Future<List<FoodModelData>> fetchData() async {
    Database? database = await FoodModelDbHelper.getDb();
    List list = await database!.query(FoodModelData.table_name);
    return list.map((map) => FoodModelData.fromMap(map)).toList();
  }
}
