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
  double takenKcal = 0;

  DailyTaken(this.date);
}
