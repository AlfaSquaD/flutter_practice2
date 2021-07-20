import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice2/blocs/daily_taken/dailytaken_bloc.dart';
import 'package:flutter_practice2/models/daily_plan/daily_plan.dart';
import 'package:flutter_practice2/models/daily_taken/daily_taken.dart';
import 'package:flutter_practice2/models/user_data/user_data.dart';
import 'package:flutter_practice2/widgets/custom_lineart_indicator.dart';
import 'package:flutter_practice2/widgets/page_template.dart';
import 'package:flutter_practice2/widgets/top_bar.dart';
import 'package:flutter_practice2/widgets/topbar_button.dart';

class DailyTakenPage extends StatelessWidget {
  DailyTakenPage({Key? key, required this.data, required this.dayOfWeek})
      : super(key: key);
  final DayOfWeek dayOfWeek;
  final UserData data;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      IndicatorData calories = mapFromUserDataCalories(
          data, BlocProvider.of<DailytakenBloc>(context).taken, dayOfWeek);
      IndicatorData protein = mapFromUserDataProtein(
          data, BlocProvider.of<DailytakenBloc>(context).taken, dayOfWeek);
      IndicatorData fat = mapFromUserDataFat(
          data, BlocProvider.of<DailytakenBloc>(context).taken, dayOfWeek);
      IndicatorData sugar = mapFromUserDataSugar(
          data, BlocProvider.of<DailytakenBloc>(context).taken, dayOfWeek);
      IndicatorData water = mapFromUserDataWater(
          data, BlocProvider.of<DailytakenBloc>(context).taken, dayOfWeek);
      return Scaffold(
        body: PageTemplate(
          topBar: TopBar(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(dayOfWeekToString(dayOfWeek),
                    style: Theme.of(context).primaryTextTheme.caption,
                    textScaleFactor: 3),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TopBarButton(
                  title: Text(
                    "Kullanıcı Bilgileri",
                    style: Theme.of(context).primaryTextTheme.caption,
                    textScaleFactor: 1.5,
                  ),
                  onTap: () {},
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: BlocListener<DailytakenBloc, DailytakenState>(
              listener: (context, state) {},
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomLinearIndicator(
                        targetName: "Kalori",
                        data: calories,
                        normalColor: Colors.green,
                        exceedColor: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomLinearIndicator(
                        targetName: "Protein",
                        data: protein,
                        normalColor: Colors.green,
                        exceedColor: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomLinearIndicator(
                        targetName: "Yağ",
                        data: fat,
                        normalColor: Colors.green,
                        exceedColor: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomLinearIndicator(
                        targetName: "Şeker",
                        data: sugar,
                        normalColor: Colors.green,
                        exceedColor: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomLinearIndicator(
                        targetName: "Su",
                        data: water,
                        normalColor: Colors.green,
                        exceedColor: Colors.red),
                  ),
                ],
              ),
            ),
            physics: BouncingScrollPhysics(),
          ),
        ),
      );
    });
  }
}

IndicatorData mapFromUserDataCalories(
    UserData data, DailyTaken dailyTaken, DayOfWeek dayOfWeek) {
  return new IndicatorData(
    target: data.dailyPlans[dayOfWeek.index].totalCalories.value,
    current: dailyTaken.takenCalories.value,
  );
}

IndicatorData mapFromUserDataProtein(
    UserData data, DailyTaken dailyTaken, DayOfWeek dayOfWeek) {
  return new IndicatorData(
    target: data.dailyPlans[dayOfWeek.index].totalProtein.value,
    current: dailyTaken.takenProtein.value,
  );
}

IndicatorData mapFromUserDataFat(
    UserData data, DailyTaken dailyTaken, DayOfWeek dayOfWeek) {
  return new IndicatorData(
    target: data.dailyPlans[dayOfWeek.index].totalFat.value,
    current: dailyTaken.takenFat.value,
  );
}

IndicatorData mapFromUserDataSugar(
    UserData data, DailyTaken dailyTaken, DayOfWeek dayOfWeek) {
  return new IndicatorData(
    target: data.dailyPlans[dayOfWeek.index].totalSugar.value,
    current: dailyTaken.takenSugar.value,
  );
}

IndicatorData mapFromUserDataWater(
    UserData data, DailyTaken dailyTaken, DayOfWeek dayOfWeek) {
  return new IndicatorData(
    target: data.dailyPlans[dayOfWeek.index].totalWaterOfGlass.value,
    current: dailyTaken.takenWater.value,
  );
}
