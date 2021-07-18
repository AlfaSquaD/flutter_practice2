part of 'dailytaken_bloc.dart';

abstract class DailytakenEvent extends Equatable {
  const DailytakenEvent();

  @override
  List<Object> get props => [];
}

class DailytakenAddFoodEvent extends DailytakenEvent {
  const DailytakenAddFoodEvent(this.foodData);
  final FoodData foodData;

  @override
  List<Object> get props => [foodData];
}

class DailytakenRemoveFoodEvent extends DailytakenEvent {
  const DailytakenRemoveFoodEvent(
      {required this.foodData, required this.index});
  final FoodData foodData;
  final int index;

  @override
  List<Object> get props => [foodData, index];
}

class DailytakenAddWaterEvent extends DailytakenEvent {}

class DailytakenRemoveWaterEvent extends DailytakenEvent {}
