import 'package:flutter/material.dart';
import 'package:to_do_list/view/add_task.dart';
import 'view/bootom_bar.dart';
import 'package:get/get.dart';
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
        GetPage(name: '/bottom', page :()=>BottomBar()),
        GetPage(name: '/add', page :()=>Add()),
      ],
      initialRoute: '/bottom',
    );
  }
}

