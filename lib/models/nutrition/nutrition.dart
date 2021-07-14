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
  // Hive fields go here
}

String nutritionTypeToString(NutritionType type) {
  switch (type) {
    case NutritionType.protein:
      return 'Protein';
    case NutritionType.fat:
      return 'Yağ';
    case NutritionType.sugar:
      return 'Şeker';
  }
}
