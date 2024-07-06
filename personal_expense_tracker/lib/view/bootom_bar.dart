// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/view/done.dart';
import '../modules/form.dart';
import 'add_task.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int current = 0;
  var formKey = GlobalKey<FormState>();
  List<Widget> selected = [Add(), Done()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: current == 0
            ? Text(
                'Tasks To-Do',
                style: TextStyle(color: Colors.white),
              )
            : Text(
                'Done Tasks',
                style: TextStyle(color: Colors.white),
              ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.bottomSheet(
            backgroundColor: const Color.fromARGB(255, 200, 199, 199),
            FormModule(
                sheetbar: 'Add',
                title: '',
                time: '',
                date: '',
                index: 0,
                mission: 0),
          );
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
          selectedItemColor: const Color.fromARGB(255, 22, 131, 221),
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded), label: 'tasks'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline_rounded), label: 'done'),
          ]),
    );
  }
}
