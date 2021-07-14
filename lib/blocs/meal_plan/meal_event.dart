part of 'meal_bloc.dart';

abstract class MealEvent {
  const MealEvent();
}

class MealAddFoodEvent extends MealEvent {
  final FoodData foodData;
  const MealAddFoodEvent({required this.foodData});

  @override
  String toString() {
    return "Food added to meal: ${foodData.food.name}";
  }
}

class MealRemoveFoodEvent extends MealEvent {
  final int index;
  const MealRemoveFoodEvent({required this.index});

  @override
  String toString() {
    return "Food removed at: $index from meal";
  }
}
