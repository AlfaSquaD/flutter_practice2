import 'package:flutter_practice2/models/food/food.dart';
import 'package:hive/hive.dart';

class HiveFoods {
  static Box<Food>? foodBox;
  static Future<List<Food>> getFoods(bool filter(Food el)) async {
    if (foodBox == null) foodBox = await Hive.openBox("food");
    return Future.value(foodBox?.values.where(filter).toList());
  }
}

class UninitializedError implements Exception {}
