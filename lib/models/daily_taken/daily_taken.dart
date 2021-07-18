import 'package:flutter_practice2/models/food_data/food_data.dart';
import 'package:flutter_practice2/models/model_id.dart';
import 'package:flutter_practice2/models/nutrition/nutrition.dart';
import 'package:hive/hive.dart';

part 'daily_taken.g.dart';

@HiveType(typeId: DailyTakenId)
class DailyTaken extends HiveObject {
  @HiveField(0)
  String date;
  @HiveField(1)
  Nutrition takenFat = new Nutrition(type: NutritionType.fat, value: 0);
  @HiveField(2)
  Nutrition takenProtein = new Nutrition(type: NutritionType.protein, value: 0);
  @HiveField(3)
  Nutrition takenSugar = new Nutrition(type: NutritionType.sugar, value: 0);
  @HiveField(4)
  Nutrition takenWater = new Nutrition(type: NutritionType.water, value: 0);
  @HiveField(5)
  Nutrition takenCalories =
      new Nutrition(type: NutritionType.calories, value: 0);
  @HiveField(6)
  List<FoodData> foodDatas = [];

  DailyTaken(this.date);

  void addFoodData(FoodData foodData) {
    this.foodDatas.add(foodData);
    takenFat.value = takenFat +
        foodData.food.totalFat * (foodData.amount / foodData.food.grams);
    takenProtein.value = takenProtein +
        foodData.food.totalProtein * (foodData.amount / foodData.food.grams);
    takenSugar.value = takenSugar +
        foodData.food.totalSugar * (foodData.amount / foodData.food.grams);
    takenCalories.value = takenCalories +
        foodData.food.kilocalories * (foodData.amount / foodData.food.grams);
  }

  void removeFoodData(FoodData foodData) {
    this.foodDatas.remove(foodData);
    takenFat.value = takenFat -
        foodData.food.totalFat * (foodData.amount / foodData.food.grams);
    takenProtein.value = takenProtein -
        foodData.food.totalProtein * (foodData.amount / foodData.food.grams);
    takenSugar.value = takenSugar -
        foodData.food.totalSugar * (foodData.amount / foodData.food.grams);
    takenCalories.value = takenCalories -
        foodData.food.kilocalories * (foodData.amount / foodData.food.grams);
  }
}
