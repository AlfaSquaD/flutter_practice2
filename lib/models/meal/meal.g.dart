// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealTypeAdapter extends TypeAdapter<MealType> {
  @override
  final int typeId = 4;

  @override
  MealType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MealType.breakfast;
      case 1:
        return MealType.launch;
      case 2:
        return MealType.afternoon;
      case 4:
        return MealType.snack;
      case 3:
        return MealType.dinner;
      default:
        return MealType.breakfast;
    }
  }

  @override
  void write(BinaryWriter writer, MealType obj) {
    switch (obj) {
      case MealType.breakfast:
        writer.writeByte(0);
        break;
      case MealType.launch:
        writer.writeByte(1);
        break;
      case MealType.afternoon:
        writer.writeByte(2);
        break;
      case MealType.snack:
        writer.writeByte(4);
        break;
      case MealType.dinner:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MealAdapter extends TypeAdapter<Meal> {
  @override
  final int typeId = 4;

  @override
  Meal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meal(
      fields[0] as MealType,
    )
      ..foods = (fields[1] as List).cast<FoodData>()
      ..totalCalories = fields[2] as Nutrition
      ..totalFat = fields[3] as Nutrition
      ..totalSugar = fields[4] as Nutrition
      ..totalProtein = fields[5] as Nutrition;
  }

  @override
  void write(BinaryWriter writer, Meal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.meal)
      ..writeByte(1)
      ..write(obj.foods)
      ..writeByte(2)
      ..write(obj.totalCalories)
      ..writeByte(3)
      ..write(obj.totalFat)
      ..writeByte(4)
      ..write(obj.totalSugar)
      ..writeByte(5)
      ..write(obj.totalProtein);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
