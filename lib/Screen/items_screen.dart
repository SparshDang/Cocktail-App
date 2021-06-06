import 'package:flutter/material.dart';

import '../widgets/item_card.dart';

class ItemsScreen extends StatelessWidget {
  final Function future;
  final String title;
  final String image;

  const ItemsScreen({this.future, this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Text(title,
                          style: Theme.of(context).textTheme.bodyText1),
                    )
                  ],
                ),
                Expanded(
                  child: FutureBuilder(
                      future: future(title),
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ));
                        } else {
                          final data = snapshot.data;
                          return ListView.builder(
                            itemBuilder: (ctx, i) {
                              var current = data[i];
                              return ItemCard(
                                id: current['idDrink'],
                                image: current["strDrinkThumb"],
                                title: current["strDrink"],
                              );
                            },
                            itemCount: data.length,
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
