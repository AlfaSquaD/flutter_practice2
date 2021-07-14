import 'package:equatable/equatable.dart';
import 'package:flutter_practice2/models/food_data/food_data.dart';
import 'package:flutter_practice2/models/model_id.dart';
import 'package:flutter_practice2/models/nutrition/nutrition.dart';
import 'package:hive/hive.dart';

part 'meal.g.dart';

@HiveType(typeId: MealId)
enum MealType {
  @HiveField(0)
  breakfast,
  @HiveField(1)
  launch,
  @HiveField(2)
  afternoon,
  @HiveField(4)
  snack,
  @HiveField(3)
  dinner
}

String mealTypeToString(MealType meal) {
  switch (meal) {
    case MealType.breakfast:
      return "Kahvaltı";
    case MealType.launch:
      return "Öğle";
    case MealType.afternoon:
      return "İkindi";
    case MealType.dinner:
      return "Akşam Yemeği";
    case MealType.snack:
      return "Ara öğün";
  }
}

@HiveType(typeId: MealId)
class Meal extends HiveObject with EquatableMixin {
  @HiveField(0)
  MealType meal;
  @HiveField(1)
  List<FoodData> foods = [];
  @HiveField(2)
  double totalKcal = 0;
  @HiveField(3)
  Nutrition totalFat = new Nutrition(type: NutritionType.fat, value: 0);
  @HiveField(4)
  Nutrition totalSugar = new Nutrition(type: NutritionType.sugar, value: 0);
  @HiveField(5)
  Nutrition totalProtein = new Nutrition(type: NutritionType.protein, value: 0);
  Meal(this.meal);

  void addFood(FoodData foodData) {
    foods.add(foodData);
    totalKcal += foodData.food.kilocalories;
    totalFat.value = totalFat + foodData.food.totalFat;
    totalSugar.value = totalSugar + foodData.food.totalSugar;
    totalProtein.value = totalProtein + foodData.food.totalProtein;
  }

  FoodData removeFood(int index) {
    FoodData foodData = foods.removeAt(index);
    totalKcal -= foodData.food.kilocalories;
    totalFat.value = totalFat - foodData.food.totalFat;
    totalSugar.value = totalSugar - foodData.food.totalSugar;
    totalProtein.value = totalProtein - foodData.food.totalProtein;
    return foodData;
  }

  @override
  List<Object?> get props => [this.meal, this.foods];
}
