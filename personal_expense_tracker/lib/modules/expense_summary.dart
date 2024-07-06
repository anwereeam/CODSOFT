import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/control/add_controller.dart';

class ExpensesSummary extends StatelessWidget {
  //const ExpensesSummary({super.key});
  late String title;
  late int control;
  ExpensesSummary({super.key, required this.title, required this.control});
  AddController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<AddController>(
          builder: (controller) {
            return control==0? Text(
              '${controller.month_sum} \$',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ):control==1?Text(
              '${controller.budget} \$',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ):Text(
              '${controller.today_sum} \$',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            );

          },
        )
      ],
    );
  }
}
