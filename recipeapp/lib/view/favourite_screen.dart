// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              'My Favorites',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 67, 146, 125)),
            ),
          ),
          
        ],
      ),
    );
  }
}
