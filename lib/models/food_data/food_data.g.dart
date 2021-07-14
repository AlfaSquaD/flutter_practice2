// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealMeasureAdapter extends TypeAdapter<MealMeasure> {
  @override
  final int typeId = 5;

  @override
  MealMeasure read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MealMeasure.grams;
      case 1:
        return MealMeasure.portion;
      default:
        return MealMeasure.grams;
    }
  }

  @override
  void write(BinaryWriter writer, MealMeasure obj) {
    switch (obj) {
      case MealMeasure.grams:
        writer.writeByte(0);
        break;
      case MealMeasure.portion:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealMeasureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FoodDataAdapter extends TypeAdapter<FoodData> {
  @override
  final int typeId = 1;

  @override
  FoodData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodData(
      food: fields[0] as Food,
      amount: fields[1] as double,
      mealMeasure: fields[2] as MealMeasure,
    );
  }

  @override
  void write(BinaryWriter writer, FoodData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.food)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.mealMeasure);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
