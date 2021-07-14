import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_practice2/models/food/food.dart';
import 'package:flutter_practice2/repo/food_repo.dart';

part 'foodsearch_event.dart';
part 'foodsearch_state.dart';

class FoodsearchBloc extends Bloc<FoodsearchEvent, FoodsearchState> {
  FoodsearchBloc(this.foodRepository) : super(FoodSearchEmpty());
  final FoodRepository foodRepository;
  @override
  Stream<FoodsearchState> mapEventToState(FoodsearchEvent event) async* {
    if (event is FoodSearchTextChangedEvent) {
      final String term = event.term;
      yield FoodSearchLoading();
      try {
        final List<Food> result = await foodRepository.getFoods(term);
        if (result.isEmpty)
          yield FoodSearchEmpty();
        else
          yield FoodSearchSuccess(result);
      } catch (err) {
        yield FoodSearchError(err.toString());
      }
    }
  }
}
