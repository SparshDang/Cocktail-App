import 'package:flutter/material.dart';

import 'Screen/main_screen.dart';
import 'Screen/item_screen.dart';
import 'Screen/category_screen.dart';
import 'Screen/ingredient_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        textTheme: TextTheme(
          bodyText1: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
          bodyText2: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
        ),
      ),
      title: "Alcohol App",
      home: MainScreen(),
      routes: {
        ItemScreen.routeName: (_) => ItemScreen(),
        CategoryScreen.routeName: (_) => CategoryScreen(),
        IngredientScreen.routeName: (_) => IngredientScreen(),
      },
    );
  }
}
