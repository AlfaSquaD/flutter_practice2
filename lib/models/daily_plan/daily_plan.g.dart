// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_plan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayOfWeekAdapter extends TypeAdapter<DayOfWeek> {
  @override
  final int typeId = 6;

  @override
  DayOfWeek read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DayOfWeek.sunday;
      case 1:
        return DayOfWeek.monday;
      case 2:
        return DayOfWeek.tuesday;
      case 3:
        return DayOfWeek.wednesday;
      case 4:
        return DayOfWeek.thursday;
      case 5:
        return DayOfWeek.friday;
      case 6:
        return DayOfWeek.saturday;
      default:
        return DayOfWeek.sunday;
    }
  }

  @override
  void write(BinaryWriter writer, DayOfWeek obj) {
    switch (obj) {
      case DayOfWeek.sunday:
        writer.writeByte(0);
        break;
      case DayOfWeek.monday:
        writer.writeByte(1);
        break;
      case DayOfWeek.tuesday:
        writer.writeByte(2);
        break;
      case DayOfWeek.wednesday:
        writer.writeByte(3);
        break;
      case DayOfWeek.thursday:
        writer.writeByte(4);
        break;
      case DayOfWeek.friday:
        writer.writeByte(5);
        break;
      case DayOfWeek.saturday:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayOfWeekAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyPlanAdapter extends TypeAdapter<DailyPlan> {
  @override
  final int typeId = 2;

  @override
  DailyPlan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyPlan(
      day: fields[0] as DayOfWeek,
    )
      ..meals = (fields[1] as List).cast<Meal>()
      ..totalFat = fields[2] as Nutrition
      ..totalSugar = fields[3] as Nutrition
      ..totalProtein = fields[4] as Nutrition
      ..totalWaterOfGlass = fields[5] as Nutrition
      ..totalCalories = fields[6] as Nutrition;
  }

  @override
  void write(BinaryWriter writer, DailyPlan obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.meals)
      ..writeByte(2)
      ..write(obj.totalFat)
      ..writeByte(3)
      ..write(obj.totalSugar)
      ..writeByte(4)
      ..write(obj.totalProtein)
      ..writeByte(5)
      ..write(obj.totalWaterOfGlass)
      ..writeByte(6)
      ..write(obj.totalCalories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
