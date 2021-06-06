import 'package:flutter/material.dart';

import './template_card.dart';
import '../Screen/ingredient_screen.dart';

class IngredientsCard extends StatelessWidget {
  final String image;
  final String title;

  const IngredientsCard({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(IngredientScreen.routeName,
            arguments: {'title': title, 'image': image});
      },
      child: TemplateCard(
        title: title,
        image: image,
      ),
    );
  }
}
