import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice2/models/daily_plan/daily_plan.dart';
import 'package:flutter_practice2/models/food/food.dart';
import 'package:flutter_practice2/models/nutrition/nutrition.dart';
import 'package:flutter_practice2/pages/user_main_page_t/user_main_page_test.dart';
import 'package:flutter_practice2/repo/food_repo.dart';
import 'package:flutter_practice2/repo/user_repo.dart';
import 'package:flutter_practice2/static.dart';
import 'package:flutter_practice2/utils/date.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(NutritionTypeAdapter());
  Hive.registerAdapter(NutritionAdapter());
  Hive.registerAdapter(FoodAdapter());
  Hive.init(dir.path);
  Date.init();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool _firstInit = sharedPreferences.getBool("firstInit") ?? true;
  if (_firstInit) {
    Box<Food> box = await Hive.openBox("food");
    var data = jsonDecode(await rootBundle.loadString("assets/data.json"));
    data["data"].forEach((el) async {
      await box.add(Food.fromJson(el));
      sharedPreferences.setBool("firstInit", false);
    });
    box.close();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DailyPlan plan = new DailyPlan(day: DayOfWeek.saturday);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => new FoodRepository()),
        RepositoryProvider(
          create: (context) => new UserRepositoryTest(),
        )
      ],
      child: MaterialApp(theme: normalTheme, home: UserMainPageTest()),
    );
  }
}
