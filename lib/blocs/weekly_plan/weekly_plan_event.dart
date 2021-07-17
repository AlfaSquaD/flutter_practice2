part of 'weekly_plan_bloc.dart';

abstract class WeeklyPlanEvent {
  const WeeklyPlanEvent();
}

class WeeklyPlanChangedEvent extends WeeklyPlanEvent {}
