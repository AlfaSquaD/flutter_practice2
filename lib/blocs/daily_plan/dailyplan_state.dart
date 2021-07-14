part of 'dailyplan_bloc.dart';

abstract class DailyplanState {
  const DailyplanState();
}

class DailyplanChangeState extends DailyplanState {
  const DailyplanChangeState({required this.plan});
  final DailyPlan plan;

  @override
  String toString() => "DailyplanChangeState {planLength: ${plan.toString()}}";
}
