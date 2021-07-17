import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice2/blocs/daily_plan/dailyplan_bloc.dart';
import 'package:flutter_practice2/blocs/meal_plan/meal_bloc.dart';
import 'package:flutter_practice2/models/daily_plan/daily_plan.dart';
import 'package:flutter_practice2/models/meal/meal.dart';
import 'package:flutter_practice2/pages/meal_plan/meal_plan.dart';
import 'package:flutter_practice2/utils/page_route.dart';
import 'package:flutter_practice2/widgets/custom_listview.dart';
import 'package:flutter_practice2/widgets/list_item.dart';
import 'package:flutter_practice2/widgets/page_template.dart';
import 'package:flutter_practice2/widgets/top_bar.dart';

// TODO: Do not use ListView!
class DailyPlanPage extends StatelessWidget {
  const DailyPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTemplate(
          topBar: TopBar(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dayOfWeekToString(
                      BlocProvider.of<DailyplanBloc>(context).plan.day),
                  style: Theme.of(context).primaryTextTheme.caption,
                  textScaleFactor: 3,
                ),
              )
            ],
          ),
          body: BlocBuilder<DailyplanBloc, DailyplanState>(
            builder: (context, state) {
              return state is DailyplanChangeState
                  ? Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomListView(
                              items: [
                                for (int i = 0; i < 5; i++)
                                  CustomListItem(
                                    subtitle:
                                        "${state.plan.meals[i].totalKcal} Kcal",
                                    trailing: Icon(
                                        Icons.keyboard_arrow_right_outlined),
                                    constraints: BoxConstraints(maxHeight: 50),
                                    title: mealTypeToString(
                                        state.plan.meals[i].meal),
                                    onTap: () async {
                                      await Navigator.of(context)
                                          .push(getPageRoute(
                                              context,
                                              BlocProvider<MealBloc>(
                                                create: (context) => MealBloc(
                                                    state.plan.meals[i]),
                                                child: MealPage(),
                                              )));
                                      BlocProvider.of<DailyplanBloc>(context)
                                          .add(DailyPlanUpdateMeal());
                                    },
                                  ),
                                CustomListItem(
                                  constraints: BoxConstraints(maxHeight: 50),
                                  title: "Su",
                                  subtitle:
                                      "${state.plan.totalWaterOfGlass.value} ml",
                                  trailing: IconButton(
                                      onPressed: () {
                                        state.plan.totalWaterOfGlass.value +=
                                            250;
                                        BlocProvider.of<DailyplanBloc>(context)
                                            .add(DailyPlanUpdateMeal());
                                      },
                                      icon: Icon(
                                        Icons.add_rounded,
                                        color: Colors.green,
                                      )),
                                  leading: IconButton(
                                    onPressed: () {
                                      if (state.plan.totalWaterOfGlass.value !=
                                          0) {
                                        state.plan.totalWaterOfGlass.value -=
                                            250;
                                        BlocProvider.of<DailyplanBloc>(context)
                                            .add(DailyPlanUpdateMeal());
                                      }
                                    },
                                    icon: Icon(Icons.remove_rounded),
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text("Bir sorun oluştu"),
                    );
            },
          )),
    );
  }
}
