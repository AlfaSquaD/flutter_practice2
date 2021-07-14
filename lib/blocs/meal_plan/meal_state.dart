part of 'meal_bloc.dart';

abstract class MealState {
  const MealState();
}

class MealAddFoodState extends MealState {
  MealAddFoodState(this.index);
  final int index;
  @override
  String toString() => "MealChangedState";
}

class MealRemoveFoodState extends MealState {
  MealRemoveFoodState(this.index, this.foodData);
  final int index;
  final FoodData foodData;
  @override
  String toString() => "MealChangedState";
}

// inital state of the meal
class MealInitState extends MealState {
  MealInitState(this.meal);
  final Meal meal;
  @override
  String toString() => "MealInitState";
}
