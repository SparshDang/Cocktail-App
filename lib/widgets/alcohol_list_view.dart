import 'package:flutter/material.dart';

import '../widgets/item_card.dart';
import '../helpers/main_data_fetcher.dart';

class AlcoholListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          );
        } else {
          final data = snapshot.data;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx, i) {
              var current = data[i];
              return ItemCard(
                id: current['idDrink'],
                image: current["strDrinkThumb"],
                title: current["strDrink"],
              );
            },
          );
        }
      },
      future: MainDataFetcher.fetchAlcoholicDrinks(),
    );
  }
}
