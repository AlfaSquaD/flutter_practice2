import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice2/blocs/food_search/foodsearch_bloc.dart';
import 'package:flutter_practice2/blocs/meal_plan/meal_bloc.dart';
import 'package:flutter_practice2/models/food_data/food_data.dart';
import 'package:flutter_practice2/models/meal/meal.dart';
import 'package:flutter_practice2/pages/food_search/food_search_page.dart';
import 'package:flutter_practice2/repo/food_repo.dart';
import 'package:flutter_practice2/utils/page_route.dart';
import 'package:flutter_practice2/widgets/list_item.dart';
import 'package:flutter_practice2/widgets/page_template.dart';
import 'package:flutter_practice2/widgets/top_bar.dart';

class MealPage extends StatelessWidget {
  const MealPage({Key? key}) : super(key: key);

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
          ],
        ),
        body: BlocBuilder<MealBloc, MealState>(
          builder: (context, state) {
            if (state is MealChangedState) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  FoodData foodData = state.meal.foods[index];
                  return CustomListItem(
                    constraints: BoxConstraints(maxHeight: 60),
                    title: foodData.food.name,
                    subtitle:
                        "${foodData.food.kilocalories.toString()} Kilokalori",
                    trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<MealBloc>(context)
                              .add(MealRemoveFoodEvent(index: index));
                        },
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        )),
                  );
                },
                itemCount: state.meal.foods.length,
              );
            } else
              return Center(
                child: Text("Bir sorun oluştu"),
              );
          },
        ),
      ),
    );
  }
}
