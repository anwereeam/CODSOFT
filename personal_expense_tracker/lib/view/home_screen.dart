import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/modules/budget_form.dart';
import '../control/add_controller.dart';

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
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: const EdgeInsets.all(20),
              height: 225,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 3, 27, 150),
              ),
              child: Center(child: GetBuilder<AddController>(
                builder: (controller) {
                  return Text(
                    '${outcontrol.budget}',
                    style: TextStyle(color: Colors.white),
                  );
                },
              )),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.only(left: 50, right: 50, top: 205),
              padding: const EdgeInsets.all(10),
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 91, 118, 252),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'daily expenses',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AddController>(
                        //init: Sum(),
                        builder: (controller) {
                          return Text(
                            '${controller.today_sum} \$',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          );
                        },
                      )
                    ],
                  ),
                  const Text(
                    '|',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  Column(
                    children: [
                      const Text(
                        'mothly expenses',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AddController>(
                        //init: Monthly(),
                        builder: (controller) {
                          return Text(
                            '${controller.month_sum} \$',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent expenses',
                style: TextStyle(fontSize: 16),
              ),
              InkWell(
                child: const Row(
                  children: [
                    Text(
                      'see all ',
                      style: TextStyle(color: Color.fromARGB(255, 3, 27, 150)),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 14,
                      color: Color.fromARGB(255, 3, 27, 150),
                    ),
                  ],
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<AddController>(
            builder: (controller1) {
              return Column(
                  children: List.generate(
                      controller1.transactions.length > 5
                          ? 5
                          : controller1.transactions.length, (index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: controller1.transactions[index].category == 'Food'
                        ? const Icon(
                            Icons.food_bank_rounded,
                          )
                        : controller1.transactions[index].category == 'Medicine'
                            ? const Icon(
                                Icons.medical_services_rounded,
                              )
                            : controller1.transactions[index].category == 'Feul'
                                ? const Icon(
                                    Icons.local_gas_station_rounded,
                                  )
                                : controller1.transactions[index].category ==
                                        'Shopping'
                                    ? const Icon(
                                        Icons.shopping_cart,
                                      )
                                    : controller1
                                                .transactions[index].category ==
                                            'Travel'
                                        ? const Icon(
                                            Icons.travel_explore_rounded,
                                          )
                                        : const Icon(
                                            Icons.school_rounded,
                                          ),
                    subtitle: Text(
                      '${controller1.transactions[index].category}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    title: Text('${controller1.transactions[index].item}',
                        style: const TextStyle(fontSize: 16)),
                    trailing: Column(
                      children: [
                        Text(
                          "${controller1.transactions[index].amount} \$",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            '${controller1.transactions[index].time.month}/${controller1.transactions[index].time.day}/${controller1.transactions[index].time.year}'),
                      ],
                    ),
                  ),
                );
              }));
            },
          ),
        )
      ],
    );
  }
}
