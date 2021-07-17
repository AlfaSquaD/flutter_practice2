import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_practice2/models/daily_plan/daily_plan.dart';

part 'dailyplan_event.dart';
part 'dailyplan_state.dart';

class DailyplanBloc extends Bloc<DailyplanEvent, DailyplanState> {
  DailyplanBloc(this.plan) : super(DailyplanChangeState(plan: plan));
  final DailyPlan plan;
  @override
  Stream<DailyplanState> mapEventToState(DailyplanEvent event) async* {
    plan.updateTotals();
    yield DailyplanChangeState(plan: plan);
  }
}
