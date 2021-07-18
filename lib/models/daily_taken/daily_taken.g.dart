// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_taken.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyTakenAdapter extends TypeAdapter<DailyTaken> {
  @override
  final int typeId = 13;

  @override
  DailyTaken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyTaken(
      fields[0] as String,
    )
      ..takenFat = fields[1] as Nutrition
      ..takenProtein = fields[2] as Nutrition
      ..takenSugar = fields[3] as Nutrition
      ..takenWater = fields[4] as Nutrition
      ..takenCalories = fields[5] as Nutrition
      ..foodDatas = (fields[6] as List).cast<FoodData>();
  }

  @override
  void write(BinaryWriter writer, DailyTaken obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.takenFat)
      ..writeByte(2)
      ..write(obj.takenProtein)
      ..writeByte(3)
      ..write(obj.takenSugar)
      ..writeByte(4)
      ..write(obj.takenWater)
      ..writeByte(5)
      ..write(obj.takenCalories)
      ..writeByte(6)
      ..write(obj.foodDatas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyTakenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
