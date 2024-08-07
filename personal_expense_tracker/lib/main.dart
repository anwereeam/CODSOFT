import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/view/add_transaction.dart';
import 'view/bottom_bar.dart';
import 'package:get/get.dart';

import 'view/home_screen.dart';
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
      title: 'expense',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 39, 90, 210)),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/home', page :()=>HomeScreen()),
        GetPage(name: '/bottom', page :()=>BottomBar()),
        GetPage(name: '/add', page :()=>Add()),
      ],
      initialRoute: '/bottom',
    );
  }
}

