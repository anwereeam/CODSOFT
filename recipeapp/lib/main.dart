// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/view/home.dart';

import 'view/ingredient_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'recipe app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 39, 90, 210)),
        useMaterial3: true,
      ),
      getPages:[
        GetPage(name: '/home', page :()=>RecipeList()),
        GetPage(name: '/ingred', page :()=>MyIngred()),
      ],
      initialRoute: '/home',
    );
  }
}

