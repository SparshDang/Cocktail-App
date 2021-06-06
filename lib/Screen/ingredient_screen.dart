import 'package:flutter/material.dart';

import '../helpers/main_data_fetcher.dart';
import "./items_screen.dart";

class IngredientScreen extends StatelessWidget {
  static const routeName = 'Ingredient-Screen';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return ItemsScreen(
      future: MainDataFetcher.fetchIngredientsDrinkData,
      title: args['title'],
      image: args['image'],
    );
  }
}
