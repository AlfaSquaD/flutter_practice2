import 'package:flutter_practice2/models/daily_plan/daily_plan.dart';
import 'package:flutter_practice2/models/daily_taken/daily_taken.dart';
import 'package:flutter_practice2/models/model_id.dart';
import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: UserDataId)
class UserData extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  List<DailyPlan> dailyPlans =
      List.generate(7, (index) => new DailyPlan(day: DayOfWeek.values[index]));
  @HiveField(3)
  List<DailyTaken> dailyTaken = [];

  UserData({required this.id, required this.name});
}
