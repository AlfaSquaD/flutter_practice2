// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodAdapter extends TypeAdapter<Food> {
  @override
  final int typeId = 0;

  @override
  Food read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Food(
      id: fields[0] as String,
      name: fields[1] as String,
      kilocalories: fields[2] as double,
      totalSugar: fields[4] as Nutrition,
      totalFat: fields[3] as Nutrition,
      totalProtein: fields[5] as Nutrition,
      grams: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Food obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.kilocalories)
      ..writeByte(3)
      ..write(obj.totalFat)
      ..writeByte(4)
      ..write(obj.totalSugar)
      ..writeByte(5)
      ..write(obj.totalProtein)
      ..writeByte(6)
      ..write(obj.grams);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
