// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutritionTypeAdapter extends TypeAdapter<NutritionType> {
  @override
  final int typeId = 11;

  @override
  NutritionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NutritionType.protein;
      case 1:
        return NutritionType.fat;
      case 2:
        return NutritionType.sugar;
      default:
        return NutritionType.protein;
    }
  }

  @override
  void write(BinaryWriter writer, NutritionType obj) {
    switch (obj) {
      case NutritionType.protein:
        writer.writeByte(0);
        break;
      case NutritionType.fat:
        writer.writeByte(1);
        break;
      case NutritionType.sugar:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NutritionAdapter extends TypeAdapter<Nutrition> {
  @override
  final int typeId = 10;

  @override
  Nutrition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrition(
      type: fields[0] as NutritionType,
      value: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Nutrition obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
