import 'package:flutter/material.dart';

import '../helpers/main_data_fetcher.dart';
import './items_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);

  static const routeName = 'CategoryScreen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return ItemsScreen(
        future: MainDataFetcher.fetchCategoryDrinkData,
        image: args['image'],
        title: args['title']);
  }
}
