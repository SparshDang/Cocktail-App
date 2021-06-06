import 'package:cocktail/widgets/ingredients_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/ingredients.dart';

class IngredientsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Ingredients>(context).fetchIngredients(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var data =
              Provider.of<Ingredients>(context, listen: false).ingredients;

          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: data.length,
            itemBuilder: (ctx, i) {
              return IngredientsCard(
                  title: data[i],
                  image:
                      'https://www.thecocktaildb.com/images/ingredients/${data[i]}-Medium.png');
            },
          );
        }
      },
    );
  }
}
