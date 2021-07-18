import 'package:equatable/equatable.dart';
import 'package:flutter_practice2/models/model_id.dart';
import 'package:hive/hive.dart';

part 'nutrition.g.dart';

@HiveType(typeId: NutritionTypeId)
enum NutritionType {
  @HiveField(0)
  protein,
  @HiveField(1)
  fat,
  @HiveField(2)
  sugar,
  @HiveField(3)
  water,
  @HiveField(4)
  calories
}

@HiveType(typeId: NutritionId)
class Nutrition extends HiveObject with EquatableMixin {
  @HiveField(0)
  NutritionType type;
  @HiveField(1)
  double value;
  Nutrition({required this.type, required this.value});

  @override
  List<Object?> get props => [type, value];

  double operator +(other) =>
      other is Nutrition ? this.value + other.value : this.value + other;

  double operator -(other) =>
      other is Nutrition ? this.value - other.value : this.value - other;

  double operator *(other) =>
      other is Nutrition ? this.value * other.value : this.value * other;

  double operator /(other) =>
      other is Nutrition ? this.value / other.value : this.value / other;

  @override
  String toString() => value.toStringAsFixed(1);
}

String nutritionTypeToString(NutritionType type) {
  switch (type) {
    case NutritionType.protein:
      return 'Protein';
    case NutritionType.fat:
      return 'Yağ';
    case NutritionType.sugar:
      return 'Şeker';
    case NutritionType.water:
      return 'Su';
    case NutritionType.calories:
      return 'Kalori';
  }
}
