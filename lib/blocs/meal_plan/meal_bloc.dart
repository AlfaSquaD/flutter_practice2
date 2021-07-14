import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_practice2/models/food_data/food_data.dart';
import 'package:flutter_practice2/models/meal/meal.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc(this.meal) : super(MealInitState(meal));
  final Meal meal;
  @override
  Stream<MealState> mapEventToState(MealEvent event) async* {
    if (event is MealAddFoodEvent) {
      meal.foods.add(event.foodData);
      yield MealAddFoodState(this.meal.foods.length - 1);
    } else if (event is MealRemoveFoodEvent) {
      FoodData data = meal.foods.removeAt(event.index);
      yield MealRemoveFoodState(event.index, data);
    }
  }
}
