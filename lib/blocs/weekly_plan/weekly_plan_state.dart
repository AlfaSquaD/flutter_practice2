part of 'weekly_plan_bloc.dart';

abstract class WeeklyPlanState {
  const WeeklyPlanState();
}

class WeeklyPlanChangedState extends WeeklyPlanState {
  final List<DailyPlan> dailyPlans;
  WeeklyPlanChangedState(this.dailyPlans);
}
