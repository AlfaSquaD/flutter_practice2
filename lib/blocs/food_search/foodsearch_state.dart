part of 'foodsearch_bloc.dart';

abstract class FoodsearchState extends Equatable {
  const FoodsearchState();

  @override
  List<Object> get props => [];
}

class FoodSearchEmpty extends FoodsearchState {}

class FoodSearchLoading extends FoodsearchState {}

class FoodSearchSuccess extends FoodsearchState {
  const FoodSearchSuccess(this.items);
  final List<Food> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => "SearchStateSuccess {itemsLength: ${items.length}}";
}

class FoodSearchError extends FoodsearchState {
  const FoodSearchError(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
