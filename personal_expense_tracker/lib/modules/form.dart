import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/tasks_controllers.dart';

class FormModule extends StatelessWidget {
  final String? title;
  final String? date;
  final String? time;
  final int? index;
  final int? mission;
  final String? sheetbar;
  FormModule({
    required this.title,
    required this.date,
    required this.time,
    required this.index,
    required this.mission,
    required this.sheetbar,
  });
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController title1 = TextEditingController(text: title);
    TextEditingController datepickercontroller =
        TextEditingController(text: date);
    TextEditingController timepickercontroller =
        TextEditingController(text: time);
    onTapFunction(BuildContext context) async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
      );
      if (pickedDate == null) return;
      datepickercontroller.text = pickedDate.toString().replaceAll('00:00:00.000', '');
    }

    onTimeFunction(BuildContext context) async {
      TimeOfDay? pickedDate = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        //firstDate: DateTime.now(),
        //lastDate: DateTime(2050),
      );
      if (pickedDate == null) return;
      timepickercontroller.text = pickedDate.format(context);
    }

    return SizedBox(
      //height: 500,
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              '$sheetbar Tasks',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'task title is required';
                  }
                  return null;
                },
                controller: title1,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: 'Task Title',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'date is required';
                  }
                  return null;
                },
                controller: datepickercontroller,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () => onTapFunction(context),
                      icon: const Icon(
                        Icons.date_range_rounded,
                        color: Color.fromARGB(255, 28, 130, 213),
                      )),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: 'Date',
                ),
                onTap: () => onTapFunction(context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'time is required';
                  }
                  return null;
                },
                controller: timepickercontroller,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () => onTimeFunction(context),
                      icon: const Icon(
                        Icons.access_time_rounded,
                        color: Color.fromARGB(255, 28, 130, 213),
                      )),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: 'Time',
                ),
                onTap: () => onTimeFunction(context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 125, right: 125),
              child: GetBuilder<AddController>(
                init: AddController(),
                builder: (controller) {
                  return ElevatedButton(
                      onPressed: mission == 2        //edit from done screen
                          ? () {
                              if (formKey.currentState!.validate()) {
                                controller.id = index! + 1;
                                controller.title = title1.text;
                                controller.date = datepickercontroller.text;
                                controller.time = timepickercontroller.text;
                                controller.done_edit_task();
                                title1.clear();
                                timepickercontroller.clear();
                                datepickercontroller.clear();
                              }
                            }
                          : mission == 1          //edit from home screen
                              ? () {
                                  if (formKey.currentState!.validate()) {
                                    controller.id = index! + 1;
                                    controller.title = title1.text;
                                    controller.date = datepickercontroller.text;
                                    controller.time = timepickercontroller.text;
                                    controller.edit_tasks();
                                    title1.clear();
                                    timepickercontroller.clear();
                                    datepickercontroller.clear();
                                  }
                                }
                              : () {              //add new task
                                  if (formKey.currentState!.validate()) {
                                    controller.title = title1.text;
                                    controller.date = datepickercontroller.text;
                                    controller.time = timepickercontroller.text;
                                    controller.add_task();
                                    title1.clear();
                                    timepickercontroller.clear();
                                    datepickercontroller.clear();
                                  }
                                },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue,
                        ),
                      ),
                      child: Text(
                        '$sheetbar',
                        style: const TextStyle(color: Colors.white),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
