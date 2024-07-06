import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:personal_expense_tracker/control/add_controller.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GetBuilder<AddController>(
              builder: (controller1) {
                return Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        controller1.get_transaction('All');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(10, 91, 118, 252),
                        ),
                        
                      ),
                      child: const Text(
                        'All',
                        style: TextStyle(
                          color: Color.fromARGB(255, 3, 27, 150),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller1.get_transaction('Food');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(10, 91, 118, 252),
                        ),
                      ),
                      child: const Text('Food',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 27, 150),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        controller1.get_transaction('Medicine');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(10, 91, 118, 252),
                        ),
                      ),
                      child: const Text('Medicine',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 27, 150),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        controller1.get_transaction('Education');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(10, 91, 118, 252),
                        ),
                      ),
                      child: const Text('Education',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 27, 150),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        controller1.get_transaction('Travel');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(10, 91, 118, 252),
                        ),
                      ),
                      child: const Text('Travel',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 27, 150),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        controller1.get_transaction('Shopping');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(10, 91, 118, 252),
                        ),
                      ),
                      child: const Text('Shopping',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 27, 150),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        controller1.get_transaction('Feul');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(10, 91, 118, 252),
                        ),
                      ),
                      child: const Text('Feul',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 27, 150),
                          )),
                    ),
                  ],
                );
              },
            )),
        
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<AddController>(
            builder: (controller1) {
              return Column(
                  children:
                      List.generate(

                        controller1.transactions.length
                        , (index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    leading:controller1.transactions[index].category=='Food'?
                    Icon(Icons.food_bank_rounded,)
                    :controller1.transactions[index].category=='Medicine'?
                    Icon(Icons.medical_services_rounded,)
                    :controller1.transactions[index].category=='Feul'?
                    Icon(Icons.local_gas_station_rounded,)
                    :controller1.transactions[index].category=='Shopping'?
                    Icon(Icons.shopping_cart,)
                    :controller1.transactions[index].category=='Travel'?
                    Icon(Icons.travel_explore_rounded,):
                    Icon(Icons.school_rounded,),
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
