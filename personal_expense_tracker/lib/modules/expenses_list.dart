// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../control/add_controller.dart';

class ExpensesList extends StatelessWidget {
  late int count;
  ExpensesList({super.key, required this.count});
  AddController controller1 = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            count == 1
                ? controller1.transactions.length
                : controller1.transactions.length > 5
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
                      : controller1.transactions[index].category == 'Shopping'
                          ? const Icon(
                              Icons.shopping_cart,
                            )
                          : controller1.transactions[index].category == 'Travel'
                              ? const Icon(
                                  Icons.travel_explore_rounded,
                                )
                              : const Icon(
                                  Icons.school_rounded,
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
  }
}
