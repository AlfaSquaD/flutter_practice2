import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice2/blocs/daily_plan/dailyplan_bloc.dart';
import 'package:flutter_practice2/blocs/meal_plan/meal_bloc.dart';
import 'package:flutter_practice2/models/daily_plan/daily_plan.dart';
import 'package:flutter_practice2/models/meal/meal.dart';
import 'package:flutter_practice2/pages/meal_plan/meal_plan.dart';
import 'package:flutter_practice2/utils/page_route.dart';
import 'package:flutter_practice2/widgets/list_item.dart';
import 'package:flutter_practice2/widgets/page_template.dart';
import 'package:flutter_practice2/widgets/top_bar.dart';

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
                  ? ListView.builder(
                      itemBuilder: (context, index) => CustomListItem(
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        constraints: BoxConstraints(maxHeight: 50),
                        title: mealTypeToString(state.plan.meals[index].meal),
                        onTap: () async {
                          await Navigator.of(context).push(getPageRoute(
                              context,
                              BlocProvider<MealBloc>(
                                create: (context) =>
                                    MealBloc(state.plan.meals[index]),
                                child: MealPage(),
                              )));
                          BlocProvider.of<DailyplanBloc>(context)
                              .add(DailyPlanUpdateMeal());
                        },
                      ),
                      itemCount: 5,
                      physics: BouncingScrollPhysics(),
                    )
                  : Center(
                      child: Text("Bir sorun oluştu"),
                    );
            },
          )),
    );
  }
}
