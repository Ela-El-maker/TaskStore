import 'package:get/get.dart';
import 'package:taskstore/db/dbHelper.dart';
import 'package:taskstore/models/taskModel.dart';

class TaskController extends GetxController {
  //  late TextEditingController taskTitleController
  //  late TextEditingController taskDescriptionController
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  // Get all the data from the table
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }
}
