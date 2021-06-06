import 'package:cocktail/Screen/item_screen.dart';
import 'package:flutter/material.dart';
import './template_card.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String image;
  final String id;

  const ItemCard({
    @required this.id,
    @required this.image,
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ItemScreen.routeName,
          arguments: {'title': title, 'id': id, 'image': image},
        );
      },
      child: TemplateCard(
        image: image,
        title: title,
      ),
    );
  }
}
