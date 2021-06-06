import 'package:cocktail/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/category.dart';

class CategoriesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Category>(context, listen: false).fetchCategories(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          var data = Provider.of<Category>(context, listen: false).categoryList;

          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: data.length,
            itemBuilder: (ctx, i) {
              return CategoryCard(
                  title: data[i]['name'], image: data[i]['image']);
            },
          );
        }
      },
    );
  }
}
