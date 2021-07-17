import 'package:flutter_practice2/models/meal/meal.dart';
import 'package:flutter_practice2/models/model_id.dart';
import 'package:flutter_practice2/models/nutrition/nutrition.dart';
import 'package:hive/hive.dart';

part 'daily_plan.g.dart';

@HiveType(typeId: DayOfWeekId)
enum DayOfWeek {
  @HiveField(0)
  sunday,
  @HiveField(1)
  monday,
  @HiveField(2)
  tuesday,
  @HiveField(3)
  wednesday,
  @HiveField(4)
  thursday,
  @HiveField(5)
  friday,
  @HiveField(6)
  saturday
}

String dayOfWeekToString(DayOfWeek dayOfWeek) {
  switch (dayOfWeek) {
    case DayOfWeek.sunday:
      return 'Sunday';
    case DayOfWeek.monday:
      return 'Monday';
    case DayOfWeek.tuesday:
      return 'Tuesday';
    case DayOfWeek.wednesday:
      return 'Wednesday';
    case DayOfWeek.thursday:
      return 'Thursday';
    case DayOfWeek.friday:
      return 'Friday';
    case DayOfWeek.saturday:
      return 'Saturday';
  }
}

@HiveType(typeId: DailyPlanId)
class DailyPlan extends HiveObject {
  @HiveField(0)
  DayOfWeek day;
  @HiveField(1)
  List<Meal> meals = List.generate(5, (index) => Meal(MealType.values[index]),
      growable: false);
  @HiveField(2)
  Nutrition totalFat = new Nutrition(type: NutritionType.fat, value: 0);
  @HiveField(3)
  Nutrition totalSugar = new Nutrition(type: NutritionType.sugar, value: 0);
  @HiveField(4)
  Nutrition totalProtein = new Nutrition(type: NutritionType.protein, value: 0);
  @HiveField(5)
  Nutrition totalWaterOfGlass =
      new Nutrition(type: NutritionType.water, value: 0);
  @HiveField(6)
  double totalKcal = 0;

  void updateTotals() {
    totalFat.value = 0;
    totalSugar.value = 0;
    totalProtein.value = 0;
    totalKcal = 0;
    for (Meal meal in meals) {
      totalFat.value += meal.totalFat.value;
      totalSugar.value += meal.totalSugar.value;
      totalProtein.value += meal.totalProtein.value;
      totalKcal += meal.totalKcal;
    }
  }

  DailyPlan({required this.day});
}
