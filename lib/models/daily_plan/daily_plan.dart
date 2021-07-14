import 'package:flutter_practice2/models/meal/meal.dart';
import 'package:flutter_practice2/models/model_id.dart';
import 'package:hive/hive.dart';

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

  DailyPlan({required this.day});
}
