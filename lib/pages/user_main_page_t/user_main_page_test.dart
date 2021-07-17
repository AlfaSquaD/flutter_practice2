import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice2/blocs/weekly_plan/weekly_plan_bloc.dart';
import 'package:flutter_practice2/models/user_data/user_data.dart';
import 'package:flutter_practice2/pages/weekly_plan/weekly_plan_page.dart';
import 'package:flutter_practice2/repo/user_repo.dart';
import 'package:flutter_practice2/utils/page_route.dart';
import 'package:flutter_practice2/widgets/page_template.dart';
import 'package:flutter_practice2/widgets/top_bar.dart';

class UserMainPageTest extends StatelessWidget {
  const UserMainPageTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTemplate(
        topBar: TopBar(
          children: [
            Text(
              'UserMainPageTest',
              style: Theme.of(context).primaryTextTheme.caption,
              textScaleFactor: 3,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(getPageRoute(
                        context,
                        BlocProvider<WeeklyPlanBloc>(
                          create: (context) {
                            UserData data =
                                RepositoryProvider.of<UserRepositoryTest>(
                                        context)
                                    .getUserData("test");
                            return WeeklyPlanBloc(data.dailyPlans);
                          },
                          child: WeeklyPlanPage(),
                        )));
                  },
                  child: Text(
                    "Planla",
                    style: Theme.of(context).primaryTextTheme.caption,
                    textScaleFactor: 1.5,
                  ),
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade500),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Takip et",
                    style: Theme.of(context).primaryTextTheme.caption,
                    textScaleFactor: 1.5,
                  ),
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade500),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))))),
            )
          ],
        ),
      ),
    );
  }
}
