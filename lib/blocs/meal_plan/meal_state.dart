part of 'meal_bloc.dart';

abstract class MealState {
  const MealState();
}

class MealChangedState extends MealState {
  const MealChangedState(this.meal);
  final Meal meal;

  @override
  String toString() => "MealChangedState";
}
