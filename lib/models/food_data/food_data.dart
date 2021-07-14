import 'package:equatable/equatable.dart';
import 'package:flutter_practice2/models/model_id.dart';
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
  FoodData(
      {required this.food, required this.amount, required this.mealMeasure});

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
