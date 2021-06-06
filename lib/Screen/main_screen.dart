import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screen/alcohol_screen.dart';
import '../Screen/categories_screen.dart';
import '../Screen/ingredients_screen.dart';
import '../provider/ingredients.dart';
import '../provider/category.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final screen = [
    CategoriesScreen(),
    AlcoholScreen(),
    IngredientsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<Category>(
          create: (_) => Category(),
        ),
        ListenableProvider<Ingredients>(
          create: (_) => Ingredients(),
        )
      ],
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                activeIcon: Icon(Icons.category),
                label: "Categories",
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_bar_outlined),
                activeIcon: Icon(Icons.sports_bar),
                label: "Alcohol",
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                activeIcon: Icon(Icons.category),
                label: "Ingredients",
                backgroundColor: Colors.transparent),
          ],
        ),
        body: PageTransitionSwitcher(
          child: screen[currentIndex],
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
