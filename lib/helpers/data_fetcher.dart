import 'dart:convert';

import 'package:http/http.dart' as http;

class DataFetcher {
  final String url;
  DataFetcher(this.url);

  bool dataFetched = false;
  String glass;
  String category;
  List<Map<String, String>> ingredients = [];
  String desc;
  String alcoholic;

  var data;

  Future<void> fetchDrinkData() async {
    final mainUrl = Uri.parse(url);
    try {
      final response = await http.get(mainUrl);
      data = json.decode(response.body)['drinks'][0];
      dataFetched = true;
    } catch (err) {}
  }

  void setData() {
    fetchIngredients();
    glass = data['strGlass'];
    category = data['strCategory'];
    desc = data['strInstructions'];
    alcoholic = data['strAlcoholic'];
  }

  void fetchIngredients() {
    int numberOfIngredients = 0;

    for (var i = 1; i < 16; i++) {
      if (data['strIngredient$i'] == null) {
        numberOfIngredients = i;
        break;
      }
    }

    for (var i = 1; i < numberOfIngredients; i++) {
      Map<String, String> curentIngredients = {
        'name': data['strIngredient$i'],
        'image':
            "https://www.thecocktaildb.com/images/ingredients/${data['strIngredient$i']}-Medium.png",
        'amount': data['strMeasure$i']
      };
      ingredients.add(curentIngredients);
    }
  }
}
