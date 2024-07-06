// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

//import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/control/add_controller.dart';
import 'package:get/get.dart';
class Add extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final TextEditingController amount=TextEditingController();

  final TextEditingController category=TextEditingController();

  final TextEditingController item=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expenses',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      ),
      body: Form(
        child: ListView(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'task title is required';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: amount,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(    
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),   
                  hintText:'price' ,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownMenu(
                trailingIcon: Icon(Icons.keyboard_arrow_down),
                dropdownMenuEntries:[
                  DropdownMenuEntry(value:0 , label: 'Food'),
                  DropdownMenuEntry(value:1 , label: 'Medicine'),
                  DropdownMenuEntry(value:2 , label: 'Education'),
                  DropdownMenuEntry(value:3 , label: 'Travel'),
                  DropdownMenuEntry(value:4 , label: 'Shopping'),
                  DropdownMenuEntry(value:5 , label: 'Feul'),
                ],
                //errorText: 'category is required',
                hintText:'category',
                controller: category,
                expandedInsets: EdgeInsets.all(0),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIconColor:Color.fromARGB(255, 91, 118, 252), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  )
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: item,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(    
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),   
                  hintText:'Item' ,
                ),
              ),
            ),
            SizedBox(height: 15,),
            
            SizedBox(height: 30,),
            
            Padding(
              padding: const EdgeInsets.only(left: 125,right: 125),
              child: GetBuilder<AddController>(
                //init: AddController(),
                builder: (controller) {
                  return ElevatedButton(
                    onPressed:(){ 
                      controller.category=category.text ;
                      controller.item=item.text;
                      controller.price=amount.text;
                      controller.add_transaction();
                      controller.monthly_sum();
                      controller.daily_sum();
                      Get.back(); 
                      //category.clear();
                      //item.clear();
                      //amount.clear();
                    },
                    style:ButtonStyle(
                      backgroundColor:MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 91, 118, 252),),
                    ),
                    child: Text('Add',style: TextStyle(color: Colors.white),)
                  );
                },
              )
            )
          ] 
        ),
      ),
    );
  }
}