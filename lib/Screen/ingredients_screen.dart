import 'package:flutter/material.dart';

import '../widgets/ingredients_grid_view.dart';

class IngredientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
            child: Image.asset(
              "asset/image/ingre.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Ingredients',
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
                Expanded(
                  child: IngredientsGridView(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
