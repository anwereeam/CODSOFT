// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/control/tasks_controllers.dart';
import 'package:personal_expense_tracker/modules/notasks.dart';

import '../modules/form.dart';

class Add extends StatelessWidget {
  //const Add({super.key});
  var formKey = GlobalKey<FormState>();

  AddController controller = Get.put(AddController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetX<AddController>(builder: (controller) {
      return controller.task.isEmpty
          ? const NoTasks(message: 'No Tasks Yet')
          : ListView(
              children: List.generate(
                controller.task.length,
                (index) {
                  return Dismissible(
                    key: Key('${controller.task[index].id}'),
                    onDismissed: (direction) {
                      controller.id = index + 1;
                      controller.main_delete();
                    },
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(178, 244, 67, 54),
                              shape: BoxShape.circle),
                          child: Center(
                              child: Text(
                            '${controller.task[index].time}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          )),
                        ),
                        title: Text('${controller.task[index].title}'),
                        subtitle: Text('${controller.task[index].date}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.bottomSheet(
                                    backgroundColor: const Color.fromARGB(
                                        255, 200, 199, 199),
                                    FormModule(
                                        sheetbar: 'Modify',
                                        title: controller.task[index].title,
                                        time: controller.task[index].time,
                                        date: controller.task[index].date,
                                        index: index,
                                        mission: 1),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                )),
                            IconButton(
                                onPressed: () {
                                  controller.id = index + 1;
                                  controller.done_tasks();
                                },
                                icon: const Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: Color.fromARGB(178, 244, 67, 54),
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
