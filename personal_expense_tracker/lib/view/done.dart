import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/control/tasks_controllers.dart';

import '../modules/form.dart';
import '../modules/notasks.dart';

class Done extends StatelessWidget {
  //const Add({super.key});
  @override
  Widget build(BuildContext context) {
    return GetX<AddController>(
        builder: (controller) {
      return controller.done.isEmpty
          ? const NoTasks(message: 'No Finished Tasks Yet')
          : ListView.builder(
              itemCount: controller.done.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key('${controller.done[index].id}'),
                  onDismissed: (direction) {
                    controller.id = index + 1;
                    controller.done_delete();
                  },
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(221, 76, 175, 79),
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          '${controller.done[index].time}',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        )),
                      ),
                      title: Text('${controller.done[index].title}'),
                      subtitle: Text('${controller.done[index].date}'),
                      trailing: IconButton(
                          icon: const Icon(
                            Icons.edit,
                          ),
                          onPressed: () {
                            Get.bottomSheet(
                              backgroundColor:
                                  const Color.fromARGB(255, 200, 199, 199),
                              FormModule(
                                  sheetbar: 'Modify',
                                  title: controller.done[index].title,
                                  time: controller.done[index].time,
                                  date: controller.done[index].date,
                                  index: index,
                                  mission:2
                                  ),
                            );
                          }),
                    ),
                  ),
                );
              },
            );
    });
  }
}
