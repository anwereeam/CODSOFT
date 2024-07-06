// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:personal_expense_tracker/model/expense_model.dart';

class AddController extends GetxController {
  late String category;
  late String price;
  late String item;
  RxList transactions = [].obs;
  RxList expenses = [].obs;
  RxInt budget=0.obs;
  double month_sum = 0;
  double today_sum = 0;
  add_transaction() {
    expenses.insert(0,ExpenseModel(
        item: item, category: category, amount: price, time: DateTime.now()));
    transactions = expenses;
    
    update();
  }
  monthly_sum() {
    if (expenses.last.time.month == DateTime.now().month &&
        expenses.last.time.year == DateTime.now().year) {
      month_sum = month_sum + int.parse(expenses.last.amount);
    }

    update();
  }
  budget_update(RxInt val) {
    budget=val;
    update();
  }

  daily_sum() {
    if (expenses.last.time.day == DateTime.now().day &&
        expenses.last.time.month == DateTime.now().month &&
        expenses.last.time.year == DateTime.now().year) {
      today_sum = today_sum + int.parse(expenses.last.amount);
    }

    update();
  }

  get_transaction(String category) {
    if (category == 'All') {
      transactions = [].obs;
      for (var element in expenses) {
        transactions.add(element);
      }
    } else {
      transactions = [].obs;
      for (var element in expenses) {
        if (element.category == category) transactions.add(element);
      }
    }
    update();
  }
}
