import 'package:flutter/material.dart';

import '../widgets/alcohol_list_view.dart';

class AlcoholScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
            child: Image.asset(
              "asset/image/alco.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Alcoholic Drinks',
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
                Expanded(
                  child: AlcoholListView(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
