part of 'dailytaken_bloc.dart';

abstract class DailytakenState extends Equatable {
  const DailytakenState();

  @override
  List<Object> get props => [];
}

class DailytakenInitial extends DailytakenState {
  const DailytakenInitial(this.dailyTaken);
  final DailyTaken dailyTaken;
}

class DailytakenAddFoodState extends DailytakenState {
  const DailytakenAddFoodState(this.foodData);
  final FoodData foodData;
}

class DailytakenRemoveFoodState extends DailytakenState {
  const DailytakenRemoveFoodState(
      {required this.foodData, required this.index});
  final FoodData foodData;
  final int index;
}
