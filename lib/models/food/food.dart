import 'package:equatable/equatable.dart';
import '../nutrition/nutrition.dart';
import 'package:flutter_practice2/models/model_id.dart';
import 'package:hive/hive.dart';

part 'food.g.dart';

@HiveType(typeId: FoodId)
class Food extends HiveObject with EquatableMixin {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  double kilocalories;
  @HiveField(3)
  Nutrition totalFat = new Nutrition(type: NutritionType.fat, value: 0);
  @HiveField(4)
  Nutrition totalSugar = new Nutrition(type: NutritionType.sugar, value: 0);
  @HiveField(5)
  Nutrition totalProtein = new Nutrition(type: NutritionType.protein, value: 0);
  @HiveField(6)
  int grams;
  // ctor.
  Food(
      {required this.id,
      required this.name,
      required this.kilocalories,
      required this.totalSugar,
      required this.totalFat,
      required this.totalProtein,
      required this.grams});

  factory Food.fromJson(Map<dynamic, dynamic> json) {
    const int grams = 100;
    return Food(
        id: json["index"].toString(),
        name: json["Product_description"],
        kilocalories: json["ENERCC_kcal"]?.toDouble() ?? 0.0,
        totalSugar: new Nutrition(
            value: json["SUGAR_g"]?.toDouble() ?? 0.0,
            type: NutritionType.sugar),
        totalFat: Nutrition(
            value: json["FAT_g"]?.toDouble() ?? 0.0 * grams,
            type: NutritionType.fat),
        totalProtein: new Nutrition(
            value: json["PROT_g"]?.toDouble() ?? 0.0 * grams,
            type: NutritionType.protein),
        grams: grams);
  }

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return this.name;
  }
}
