import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Ingredients with ChangeNotifier {
  var ingredients = [];

  Future<void> fetchIngredients() async {
    if (ingredients.isNotEmpty) {
      return;
    }

    final mainUrl = Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list');

    final response = await http.get(mainUrl);
    var nameList = json.decode(response.body)['drinks'];

    for (var i in nameList) {
      ingredients.add(i["strIngredient1"]);
      notifyListeners();
    }
  }
}
