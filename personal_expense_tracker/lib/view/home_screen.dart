import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/modules/budget_form.dart';
import 'package:personal_expense_tracker/modules/categories.dart';
import 'package:personal_expense_tracker/modules/expense_summary.dart';
import '../control/add_controller.dart';
import '../modules/expenses_list.dart';

class HomeScreen extends StatelessWidget {
  AddController outcontrol = Get.put(AddController(), permanent: true);
  var formKey = GlobalKey<FormState>();
  final TextEditingController budget = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Expense tracker',
                style: TextStyle(fontSize: 18),
              ),
              InkWell(
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'set budget ',
                      style: TextStyle(color: Color.fromARGB(255, 3, 27, 150)),
                    ),
                    Icon(
                      Icons.account_balance_wallet_rounded,
                      size: 14,
                      color: Color.fromARGB(255, 3, 27, 150),
                    ),
                  ],
                ),
                onTap: () {
                  Get.bottomSheet(BudgetForm());
                },
              )
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.only(right: 100, left: 100, top: 80),
              padding: const EdgeInsets.all(20),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 3, 27, 150),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ExpensesSummary(title: 'Today expenses',control: 2,),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 25),
              padding: const EdgeInsets.all(10),
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 91, 118, 252),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ExpensesSummary(title: 'Monthly expenses',control: 0,),
                  const Text(
                    '|',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  ExpensesSummary(title: 'Monthly budget',control: 1,)
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Transactions category',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Categories(title: 'Food', type: Icons.food_bank_rounded),
            Categories(title: 'Medical', type: Icons.medical_services_rounded),
            Categories(title: 'Educational', type: Icons.school_rounded),
            Categories(title: 'Travel', type: Icons.travel_explore_rounded),
            Categories(title: 'Shopping', type: Icons.shopping_cart),
            Categories(title: 'Fuel', type: Icons.ev_station_rounded)
          ],
        ),
        SizedBox(height: 10,),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Recent expenses',
            style: TextStyle(fontSize: 16),
          ),
        ),
        GetBuilder<AddController>(builder: (controller1) {
          return ExpensesList(count: 0);
        })
      ],
    );
  }
}
