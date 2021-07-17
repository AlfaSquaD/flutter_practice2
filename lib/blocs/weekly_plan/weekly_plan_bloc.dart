import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_practice2/models/daily_plan/daily_plan.dart';

part 'weekly_plan_event.dart';
part 'weekly_plan_state.dart';

class WeeklyPlanBloc extends Bloc<WeeklyPlanEvent, WeeklyPlanState> {
  WeeklyPlanBloc(this.dailyPlans) : super(WeeklyPlanChangedState(dailyPlans));
  final List<DailyPlan> dailyPlans;
  @override
  Stream<WeeklyPlanState> mapEventToState(
    WeeklyPlanEvent event,
  ) async* {
    yield WeeklyPlanChangedState(dailyPlans);
  }
}
