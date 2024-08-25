// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart' as getx;

import 'package:get/state_manager.dart';
import 'package:recipeapp/model/instruction.dart' as instruc;
import 'package:recipeapp/model/recipe_model.dart';
import '../model/ingredients.dart';

class Recipe extends getx.GetxController {
  RxBool fav_cond = false.obs;
  RxList recipedata = [].obs;
  RxList ingradientdata = [].obs;
  late RxList<instruc.Instructions> instrucdata;
  RxBool instruction_condition = false.obs;
  String error = 'Develpment error';
  var loadData = false.obs;
  var loadData1 = false.obs;
  static const String apiKey = 'd8d9a74b8f414a8492b1926d838c3523';
  static const String baseUrl =
      'https://api.spoonacular.com/recipes/complexSearch';

  Dio dio = Dio();
  //final Connectivity _connectivity = Connectivity();
  @override
  void onReady() {
    super.onReady();
    makeRequest();
  }

  Future<void> makeRequest({String type='soup',String query=''}) async {
    loadData.value = true;
    try {
      Response response = await dio.get(baseUrl, 
          queryParameters:query==''?
            {'number': 200, 'type': type,'apiKey': apiKey}:
            {'number': 200,'query':query,'apiKey': apiKey},
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode == 200) {
        //final List<dynamic>? data = response.data;
        final Map<String, dynamic> data = response.data;
        final List<dynamic> recipes = data['results'];
        final medicines =
            recipes.map((json) => Results.fromJson(json)).toList();
        recipedata = medicines.obs;
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        error = 'Internet connection error';
      } else {
        error = e.message.toString();
      }
    }
    loadData.value = false;
  }

  //Dio dio1 = Dio();
  late int index;
  Future<void> getingerd(x) async {
    //ingradientdata.clear();
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
        //instruction_condition=false;
      }
    } catch (e) {
      error = e.toString();
    } 
    update();
  }

/*-------------------get steps -----------------*/
  Future<void> getsteps(x) async {
    //ingradientdata.clear();
    String ingred =
        'https://api.spoonacular.com/recipes/$x/analyzedInstructions';

    try {
      Response response = await dio.get(ingred,
          queryParameters: {'apiKey': apiKey},
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        //final recipes = data[0]['steps'];
        final medicines =
            data.map((json) => instruc.Instructions.fromJson(json)).toList();
        //print(medicines);
        instrucdata = medicines.obs;
        //instrucdata=instrucdata[0];
        instrucdata.refresh();
        //print(instrucdata);
      }
    } catch (e) {
      error = e.toString();
    } 
    loadData1.value = false;
    update();
  }

  void showingred() {
    instruction_condition = false.obs;
    update();
  }

  void showdetails() {
    instruction_condition = true.obs;
    update();
  }

  /*check if the element is favourite or not */
  Future<RxBool> isItemInFavorites(String itemId) async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    if (userId != null) {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(itemId);

      final docSnapshot = await docRef.get();
      return docSnapshot.exists.obs; // Returns true if the document exists
    }

    return false.obs; // If the user is not logged in or something else fails
  }

  /*add item to favourite using firebase*/
  Future<void> addToFavorites(
      String itemId, Map<String, dynamic> itemDetails) async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    if (userId != null) {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(itemId);
      await docRef.set(itemDetails);
    }
  }
  /*remove item from favourite using firebase*/
  Future<void> removeFromFavorites(String itemId) async {
  final user = FirebaseAuth.instance.currentUser;
  final userId = user?.uid;

  if (userId != null) {
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(itemId);

    await docRef.delete();
  }
}
}
