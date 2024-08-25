// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:recipeapp/view/favourite_screen.dart';
import 'home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int current = 0;
  var formKey = GlobalKey<FormState>();
  List<Widget> selected = [RecipeList(), FavouriteScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selected[current],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          onTap: (value) {
            current = value;
            setState(() {});
          },
          elevation: 30,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Color.fromARGB(255, 0, 121, 107),
          unselectedItemColor: Color.fromARGB(255, 117, 117, 117),
          items: [
            BottomNavigationBarItem(
                icon: current==1?Icon(Icons.home_outlined):Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon:current==0?Icon(Icons.favorite_border_rounded):Icon(Icons.favorite_rounded), label: 'Favourite'),
          ]),
    );
  }
}
