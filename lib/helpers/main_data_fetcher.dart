import 'dart:convert';

import 'package:http/http.dart' as http;

class MainDataFetcher {
  static Future<List<dynamic>> fetchCategoryDrinkData(title) async {
    final mainUrl = Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$title");
    final response = await http.get(mainUrl);
    return json.decode(response.body)['drinks'];
  }

  static Future<List<dynamic>> fetchIngredientsDrinkData(title) async {
    final mainUrl = Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=$title");
    final response = await http.get(mainUrl);
    return json.decode(response.body)['drinks'];
  }

  static Future<List<dynamic>> fetchAlcoholicDrinks() async {
    final mainUrl = Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic');
    final response = await http.get(mainUrl);
    return json.decode(response.body)['drinks'];
  }
}
