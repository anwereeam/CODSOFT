// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_rx/get_rx.dart';
import 'package:recipeapp/model/recipe_model.dart';

import '../model/ingredients.dart';

class Recipe extends getx.GetxController {
  RxList recipedata = [].obs;
  RxList ingradientdata = [].obs;
  String error = 'Develpment error';
  var loadData = false.obs;
  var loadData1 = false.obs;
  static const String apiKey = 'd8d9a74b8f414a8492b1926d838c3523';
  static const String baseUrl =
      'https://api.spoonacular.com/recipes/complexSearch';

  Dio dio = Dio();
  @override
  void onInit() async {
    loadData.value = true;
    try {
      Response response = await dio.get(baseUrl,
          queryParameters: {'number': 200, 'query': 'meat', 'apiKey': apiKey},
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode == 200) {
        //final List<dynamic>? data = response.data;
        final Map<String, dynamic> data = response.data;
        final List<dynamic> recipes = data['results'];
        final medicines =
            recipes.map((json) => Results.fromJson(json)).toList();
        recipedata = medicines.obs;
      }
    } catch (e) {
      error = e.toString();
    } finally {
      //dio.close();
    }

    loadData.value = false;
    update();
    super.onInit();
  }
  //Dio dio1 = Dio();
  late int index;
  Future<void> getingerd(x)async {
    ingradientdata.clear();
  String ingred =
        'https://api.spoonacular.com/recipes/$x/ingredientWidget.json';
    loadData1.value = true;
    try {
      Response response = await dio.get(ingred,
          queryParameters: {'apiKey': apiKey},
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final List<dynamic> recipes = data['ingredients'];
        final medicines =
            recipes.map((json) => Ingredients.fromJson(json)).toList();
        ingradientdata = medicines.obs;
        ingradientdata.refresh();
      }
    } catch (e) {
      error = e.toString();
    } finally {
      //dio1.close();
    }
    loadData1.value = false;
    update();
  }


/*-------------------get ingredients -----------------*/
}

