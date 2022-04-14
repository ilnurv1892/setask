import 'package:firebase_task_data_api/src/models/task.dart';

abstract class TaskApi {
  Stream<List<Task>> getTask();
}
