//import 'package:flutter/material.dart';

class ExpenseModel {
  String item;
  String amount;
  String category;
  DateTime time;
  ExpenseModel({required this.item,required this.amount,required this.category,required this.time});
}
List<ExpenseModel> expenses =[];