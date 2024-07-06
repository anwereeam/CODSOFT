// ignore_for_file: non_constant_identifier_names
import 'package:get/get.dart';
import 'package:to_do_list/model/tasks_model.dart';
class AddController extends GetxController {
  late String title;
  late String date;
  late String time;
  late int id;
  RxList<dynamic> task=[].obs ;
  RxList<dynamic> done =[].obs;
  add_task() {
    task.add(TaskModel(title: title, date: date, time: time, id: task.length));      
  }
  done_tasks() {
      done.add(task[id-1]);
      task.removeAt(id-1);
      task.refresh();
  }
  main_delete()
  {
    task.removeAt(id-1);
  }
  done_delete()
  {
    done.removeAt(id-1);
  }
  edit_tasks()
  {
    task[id-1]=TaskModel(title: title, id: id, date: date, time: time);
  }
  done_edit_task()
  {
    done[id-1]=TaskModel(title: title, id: id, date: date, time: time);
  }
}
