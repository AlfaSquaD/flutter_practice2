import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice2/blocs/food_search/foodsearch_bloc.dart';
import 'package:flutter_practice2/blocs/meal_plan/meal_bloc.dart';
import 'package:flutter_practice2/models/food_data/food_data.dart';
import 'package:flutter_practice2/models/meal/meal.dart';
import 'package:flutter_practice2/models/nutrition/nutrition.dart';
import 'package:flutter_practice2/pages/food_search/food_search_page.dart';
import 'package:flutter_practice2/repo/food_repo.dart';
import 'package:flutter_practice2/utils/page_route.dart';
import 'package:flutter_practice2/widgets/list_item.dart';
import 'package:flutter_practice2/widgets/page_template.dart';
import 'package:flutter_practice2/widgets/top_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MealPage extends StatelessWidget {
  MealPage({Key? key}) : super(key: key);
  final GlobalKey<AnimatedListState> animListKey =
      new GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomListItem(
        constraints: BoxConstraints(maxHeight: 40),
        leading: Icon(
          Icons.add_rounded,
          color: Theme.of(context).primaryColor,
        ),
        title: "Yemek ekle",
        onTap: () async {
          var result = await Navigator.of(context).push(getPageRoute(
              context,
              BlocProvider(
                create: (context) => FoodsearchBloc(
                    RepositoryProvider.of<FoodRepository>(context)),
                child: FoodSearchPage(),
              )));
          if (result != null) {
            BlocProvider.of<MealBloc>(context)
                .add(MealAddFoodEvent(foodData: result));
          }
        },
      ),
      body: PageTemplate(
        topBar: TopBar(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                mealTypeToString(BlocProvider.of<MealBloc>(context).meal.meal),
                style: Theme.of(context).primaryTextTheme.caption,
                textScaleFactor: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 200,
                child: TextButton(
                    onPressed: () {
                      Meal meal = BlocProvider.of<MealBloc>(context).meal;
                      Navigator.of(context).push(
                          getPageRoute(context, MealDetailPage(meal: meal)));
                    },
                    child: Text(
                      "Detaylar",
                      style: Theme.of(context).primaryTextTheme.caption,
                      textScaleFactor: 1.5,
                    ),
                    style: Theme.of(context).textButtonTheme.style!.copyWith(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green.shade500),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))))),
              ),
            )
          ],
        ),
        body: BlocListener<MealBloc, MealState>(
          listener: (context, state) {
            if (state is MealRemoveFoodState) {
              FoodData foodData = state.foodData;
              animListKey.currentState!.removeItem(
                state.index,
                (context, animation) => AnimatedListTile(
                    begin: Offset(1, 0),
                    end: Offset(0, 0),
                    animation: animation,
                    foodData: foodData,
                    index: state.index),
              );
            } else if (state is MealAddFoodState) {
              animListKey.currentState!.insertItem(state.index);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: AnimatedList(
              key: animListKey,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index, animation) {
                FoodData foodData =
                    BlocProvider.of<MealBloc>(context).meal.foods[index];
                return AnimatedListTile(
                    begin: Offset(0, 0.5),
                    end: Offset(0, 0),
                    animation: animation,
                    foodData: foodData,
                    index: index);
              },
              initialItemCount:
                  BlocProvider.of<MealBloc>(context).meal.foods.length,
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedListTile extends StatelessWidget {
  const AnimatedListTile(
      {Key? key,
      required this.begin,
      required this.end,
      required this.animation,
      required this.foodData,
      required this.index})
      : super(key: key);
  final Offset begin;
  final Offset end;
  final Animation<double> animation;
  final FoodData foodData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(Tween(begin: begin, end: end)),
      child: SizeTransition(
        sizeFactor: animation,
        child: CustomListItem(
          constraints: BoxConstraints(maxHeight: 60),
          title: foodData.food.name,
          subtitle: "${foodData.food.kilocalories.toString()} Kilokalori",
          trailing: IconButton(
              onPressed: () {
                BlocProvider.of<MealBloc>(context)
                    .add(MealRemoveFoodEvent(index: index));
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({Key? key, required this.meal}) : super(key: key);
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTemplate(
        topBar: TopBar(
          children: [
            Text(
              mealTypeToString(meal.meal),
              style: Theme.of(context).primaryTextTheme.caption,
              textScaleFactor: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Detaylar",
                style: Theme.of(context).primaryTextTheme.caption,
                textScaleFactor: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${meal.totalKcal.toString()} Kilokalori",
                  style: Theme.of(context).primaryTextTheme.caption,
                  textScaleFactor: 1.5),
            )
          ],
        ),
        body: Column(
          children: [
            SfCircularChart(
                title: ChartTitle(text: "İçerikler"),
                legend: Legend(
                    isVisible: true,
                    alignment: ChartAlignment.center,
                    offset: Offset.zero),
                series: <PieSeries<Nutrition, String>>[
                  PieSeries<Nutrition, String>(
                      enableSmartLabels: true,
                      explode: false,
                      dataSource: getNutritionList(meal),
                      xValueMapper: (Nutrition data, _) =>
                          nutritionTypeToString(data.type),
                      yValueMapper: (Nutrition data, _) => data.value,
                      dataLabelMapper: (Nutrition data, _) =>
                          "${data.value} gr",
                      animationDuration: 700, //ms
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                      )),
                ]),
          ],
        ),
      ),
    );
  }

  List<Nutrition> getNutritionList(Meal meal) {
    List<Nutrition> _result = [];
    if (meal.totalFat.value > 0) _result.add(meal.totalFat);
    if (meal.totalProtein.value > 0) _result.add(meal.totalProtein);
    if (meal.totalSugar.value > 0) _result.add(meal.totalSugar);
    return _result;
  }
}
