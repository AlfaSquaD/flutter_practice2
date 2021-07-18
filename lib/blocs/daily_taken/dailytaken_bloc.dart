import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_practice2/models/daily_taken/daily_taken.dart';
import 'package:flutter_practice2/models/food/food.dart';
import 'package:flutter_practice2/models/food_data/food_data.dart';

part 'dailytaken_event.dart';
part 'dailytaken_state.dart';

class DailytakenBloc extends Bloc<DailytakenEvent, DailytakenState> {
  DailytakenBloc(this.taken) : super(DailytakenInitial(taken));
  final DailyTaken taken;
  @override
  Stream<DailytakenState> mapEventToState(
    DailytakenEvent event,
  ) async* {
    if (event is DailytakenAddFoodEvent) {
      taken.addFoodData(event.foodData);
      yield DailytakenAddFoodState(event.foodData);
    } else if (event is DailytakenRemoveFoodEvent) {
      taken.removeFoodData(event.foodData);
      yield DailytakenRemoveFoodState(
          foodData: event.foodData, index: event.index);
    } else if (event is DailytakenAddWaterEvent) {
      taken.takenWater.value = taken.takenWater + 250;
      yield DailytakenInitial(taken);
    } else if (event is DailytakenRemoveWaterEvent) {
      taken.takenWater.value = taken.takenWater - 250;
      yield DailytakenInitial(taken);
    } else
      yield DailytakenInitial(taken);
  }
}
