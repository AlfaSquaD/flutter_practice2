import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice2/blocs/daily_plan/dailyplan_bloc.dart';
import 'package:flutter_practice2/blocs/weekly_plan/weekly_plan_bloc.dart';
import 'package:flutter_practice2/models/daily_plan/daily_plan.dart';
import 'package:flutter_practice2/pages/daily_plan/daily_plan_page.dart';
import 'package:flutter_practice2/utils/page_route.dart';
import 'package:flutter_practice2/widgets/custom_listview.dart';
import 'package:flutter_practice2/widgets/list_item.dart';
import 'package:flutter_practice2/widgets/page_template.dart';
import 'package:flutter_practice2/widgets/top_bar.dart';

class WeeklyPlanPage extends StatelessWidget {
  const WeeklyPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTemplate(
          topBar: TopBar(
            children: [
              Text(
                "Haftalık plan",
                style: Theme.of(context).primaryTextTheme.caption,
                textScaleFactor: 3,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<WeeklyPlanBloc, WeeklyPlanState>(
              builder: (context, state) {
                if (state is WeeklyPlanChangedState)
                  return CustomListView(
                    items: [
                      for (int i = 0; i < 7; i++)
                        CustomListItem(
                          constraints: BoxConstraints(maxHeight: 50),
                          title: dayOfWeekToString(DayOfWeek.values[i]),
                          subtitle:
                              "${BlocProvider.of<WeeklyPlanBloc>(context).dailyPlans[i].totalKcal} Kcal",
                          trailing: Icon(Icons.arrow_right),
                          onTap: () async {
                            await Navigator.of(context).push(getPageRoute(
                                context,
                                BlocProvider<DailyplanBloc>(
                                  create: (context) =>
                                      DailyplanBloc(state.dailyPlans[i]),
                                  child: DailyPlanPage(),
                                )));
                            BlocProvider.of<WeeklyPlanBloc>(context)
                                .add(WeeklyPlanChangedEvent());
                          },
                        )
                    ],
                  );
                else
                  return Center(
                    child: Text("Bir sorun oluştu"),
                  );
              },
            ),
          )),
    );
  }
}
