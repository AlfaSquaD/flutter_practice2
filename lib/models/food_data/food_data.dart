import 'package:equatable/equatable.dart';
import 'package:flutter_practice2/models/model_id.dart';
import 'package:flutter_practice2/models/nutrition/nutrition.dart';
import 'package:hive/hive.dart';
import '../food/food.dart';

part 'food_data.g.dart';

@HiveType(typeId: FoodDataId)
class FoodData extends HiveObject with EquatableMixin {
  @HiveField(0)
  Food food;
  @HiveField(1)
  double amount;
  @HiveField(2)
  MealMeasure mealMeasure;
  @HiveField(3)
  Nutrition totalSugar = new Nutrition(value: 0, type: NutritionType.sugar);
  @HiveField(4)
  Nutrition totalFat = new Nutrition(value: 0, type: NutritionType.fat);
  @HiveField(5)
  Nutrition totalProtein = new Nutrition(value: 0, type: NutritionType.protein);
  @HiveField(6)
  Nutrition calories = new Nutrition(type: NutritionType.calories, value: 0);
  FoodData({
    required this.food,
    required this.amount,
    required this.mealMeasure,
    required double totalCalories,
    required double totalSugar,
    required double totalFat,
    required double totalProtein,
  }) {
    this.totalSugar.value = totalSugar;
    this.totalFat.value = totalFat;
    this.totalProtein.value = totalProtein;
    this.calories.value = totalCalories;
  }

  @override
  String toString() {
    return this.food.name;
  }

  @override
  List<Object?> get props => [this.food.id, this.amount, this.mealMeasure];
}

@HiveType(typeId: MealMeasureId)
enum MealMeasure {
  @HiveField(0)
  grams,
  @HiveField(1)
  portion
}

String MealMeasureToString(MealMeasure measure) {
  return measure == MealMeasure.grams ? "Gram" : "Porsiyon";
}
