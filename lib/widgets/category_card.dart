import 'package:cocktail/Screen/category_screen.dart';
import 'package:cocktail/widgets/template_card.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;

  const CategoryCard({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryScreen.routeName,
            arguments: {'title': title, 'image': image});
      },
      child: TemplateCard(
        title: title,
        image: image,
      ),
    );
  }
}
