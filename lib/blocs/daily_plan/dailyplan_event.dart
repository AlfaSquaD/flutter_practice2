part of 'dailyplan_bloc.dart';

abstract class DailyplanEvent {
  const DailyplanEvent();
}

class DailyPlanUpdateMeal extends DailyplanEvent {
  const DailyPlanUpdateMeal();

  @override
  String toString() {
    return "Meal changed";
  }
}
