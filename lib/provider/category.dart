import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category with ChangeNotifier {
  var categoryList = [];

  Future<void> fetchCategories() async {
    if (categoryList.isNotEmpty) {
      return;
    }

    final mainUrl = Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list');

    final response = await http.get(mainUrl);
    var nameList = json.decode(response.body)['drinks'];

    for (var i in nameList) {
      var image = await getCategoryImages(i["strCategory"]);
      categoryList.add({
        'name': i["strCategory"],
        'image': image,
      });
      notifyListeners();
    }
  }

  Future<String> getCategoryImages(category) async {
    final mainUrl = Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$category');

    final response = await http.get(mainUrl);
    String image = json.decode(response.body)['drinks'][0]['strDrinkThumb'];
    return image;
  }
}
