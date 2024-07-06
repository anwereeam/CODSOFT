// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/view/home_screen.dart';
import 'expense_screan.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int current = 0;
  var formKey = GlobalKey<FormState>();
  List<Widget> selected = [HomeScreen(), Expenses()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        shape:CircleBorder(),
        backgroundColor: Color.fromARGB(255, 3, 27, 150),
        foregroundColor: Colors.white,
        onPressed: () {
          Get.toNamed('/add');
        },
      ),
      backgroundColor: const Color(0xffeeedf2),
      body: selected[current],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          onTap: (value) {
            current = value;
            setState(() {});
          },
          elevation: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color.fromARGB(255, 3, 27, 150),
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows_rounded), label: 'transactions'),
          ]),
    );
  }
}