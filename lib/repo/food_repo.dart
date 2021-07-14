import 'dart:async';
import 'package:flutter_practice2/models/food/food.dart';
import 'package:flutter_practice2/models/hive/food_hive.dart';

class FoodRepository {
  const FoodRepository();
  Future<List<Food>> getFoods(String term) async {
    final result = await HiveFoods.getFoods(term != ""
        ? (el) => el.name.toLowerCase().contains(term.toLowerCase())
        : (el) => true);
    return result;
  }
}
