import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice2/blocs/food_search/foodsearch_bloc.dart';
import 'package:flutter_practice2/models/food/food.dart';
import 'package:flutter_practice2/models/food_data/food_data.dart';
import 'package:flutter_practice2/models/nutrition/nutrition.dart';
import 'package:flutter_practice2/utils/page_route.dart';
import 'package:flutter_practice2/widgets/circular_chart.dart';
import 'package:flutter_practice2/widgets/list_item.dart';
import 'package:flutter_practice2/widgets/page_template.dart';
import 'package:flutter_practice2/widgets/search_field.dart';
import 'package:flutter_practice2/widgets/top_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FoodSearchPage extends StatelessWidget {
  const FoodSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FoodsearchBloc>(context)
        .add(FoodSearchTextChangedEvent(term: ""));
    return Scaffold(
      body: PageTemplate(
          topBar: TopBar(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Yiyecek Seç",
                  textScaleFactor: 3,
                  style: Theme.of(context).primaryTextTheme.caption,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchField(
                  onChanged: (val) => BlocProvider.of<FoodsearchBloc>(context)
                      .add(FoodSearchTextChangedEvent(term: val)),
                ),
              )
            ],
          ),
          body: _SearchResults()),
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodsearchBloc, FoodsearchState>(
      builder: (context, state) {
        if (state is FoodSearchLoading)
          return const Center(child: const CircularProgressIndicator());
        else if (state is FoodSearchEmpty)
          return const Center(
            child: const Text("Bir şey bulunamadı!"),
          );
        else if (state is FoodSearchError)
          return Center(
            child: Text(state.error.toString()),
          );
        else if (state is FoodSearchSuccess)
          return ListView.builder(
            itemBuilder: (context, index) {
              Food food = state.items[index];
              return CustomListItem(
                  title: food.name,
                  subtitle: "${food.kilocalories.toString()} Kilokalori",
                  onTap: () => onTap(context, food),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined));
            },
            itemCount: state.items.length,
            itemExtent: 70,
            physics: BouncingScrollPhysics(),
          );
        else
          return const Center(
            child: const Text("Bir şeyler ters gitti :/"),
          );
      },
    );
  }

  void onTap(BuildContext context, Food food) async {
    var result = await Navigator.push(
        context, getPageRoute(context, _ItemDescription(food: food)));
    if (result is FoodData) Navigator.of(context).pop(result);
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({Key? key, required this.food}) : super(key: key);
  final Food food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTemplate(
        topBar: TopBar(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                food.name,
                style: Theme.of(context).primaryTextTheme.caption,
                textScaleFactor: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${food.kilocalories.toString()} Kilokalori",
                style: Theme.of(context).primaryTextTheme.caption,
                textScaleFactor: 1,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularChart<Nutrition>(
                    dataSource: getNutritionList(food),
                    xMapper: (Nutrition data, _) =>
                        nutritionTypeToString(data.type),
                    dataLabelMapper: (Nutrition data, _) => "${data.value} gr",
                    yMapper: (Nutrition data, _) => data.value,
                    chartTitle: "İçerikler"),
                AddFoodWidget(food: food)
              ]),
        ),
      ),
    );
  }

  List<Nutrition> getNutritionList(Food food) {
    List<Nutrition> _result = [];
    if (food.totalFat.value > 0) _result.add(food.totalFat);
    if (food.totalProtein.value > 0) _result.add(food.totalProtein);
    if (food.totalSugar.value > 0) _result.add(food.totalSugar);
    return _result;
  }
}

class AddFoodWidget extends StatefulWidget {
  const AddFoodWidget({Key? key, required this.food}) : super(key: key);
  final Food food;
  @override
  _AddFoodWidgetState createState() => _AddFoodWidgetState();
}

class _AddFoodWidgetState extends State<AddFoodWidget> {
  final TextEditingController _mealAmountController =
      TextEditingController(text: "1");
  MealMeasure selected = MealMeasure.portion;
  bool _validateMealAmount = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Porsiyon"),
            Switch(
                activeTrackColor: Colors.grey,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                value: selected == MealMeasure.grams,
                onChanged: (value) {
                  setState(() {
                    selected = value ? MealMeasure.grams : MealMeasure.portion;
                  });
                }),
            Text("Gram")
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
              controller: _mealAmountController,
              cursorColor: Colors.blueGrey,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorText:
                    _validateMealAmount ? "Geçerli bir sayı giriniz!" : null,
                labelText: "Miktar",
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0, 20, 0, MediaQuery.of(context).viewInsets.bottom),
          child: TextButton(
            child: Text("Ekle",
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            onPressed: () {
              double? amount = double.tryParse(_mealAmountController.text);
              if (amount == null || amount <= 0)
                _validateMealAmount = true;
              else
                Navigator.pop(
                    context,
                    FoodData(
                      food: widget.food,
                      amount: amount,
                      mealMeasure: selected,
                      totalFat: selected == MealMeasure.portion
                          ? widget.food.totalFat * amount
                          : widget.food.totalFat * (amount / widget.food.grams),
                      totalProtein: selected == MealMeasure.portion
                          ? widget.food.totalProtein * amount
                          : widget.food.totalProtein *
                              (amount / widget.food.grams),
                      totalSugar: selected == MealMeasure.portion
                          ? widget.food.totalSugar * amount
                          : widget.food.totalSugar *
                              (amount / widget.food.grams),
                      totalCalories: selected == MealMeasure.portion
                          ? widget.food.kilocalories * amount
                          : widget.food.kilocalories *
                              (amount / widget.food.grams),
                    ));
            },
          ),
        )
      ],
    );
  }
}
