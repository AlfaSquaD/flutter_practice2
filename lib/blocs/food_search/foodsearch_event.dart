part of 'foodsearch_bloc.dart';

abstract class FoodsearchEvent extends Equatable {
  const FoodsearchEvent();
}

class FoodSearchTextChangedEvent extends FoodsearchEvent {
  final String term;
  const FoodSearchTextChangedEvent({required this.term});

  @override
  List<Object> get props => [term];

  @override
  String toString() => "TextChanged {term: $term}";
}
