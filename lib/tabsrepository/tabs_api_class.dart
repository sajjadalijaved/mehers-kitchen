import 'dart:convert';

import 'package:mehers_kitchen/modelclasses/category_id_model_page.dart';
import 'package:http/http.dart';

class TabsServices {
  static const baseURL =
      "https://food.elms.pk/api/FoodDelivery/PublicGetListCategory";

  Future<List<CategoryModel>> getCategoryList() async {
    var response = await get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);

      return list.map((e) => CategoryModel.fromMap(e)).toList();
    }
    return [];
  }
}
