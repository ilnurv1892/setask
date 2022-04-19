import 'package:firebase_repository/src/models/task_model.dart';

abstract class TaskApi {
  Stream<List<TaskModel>> getTask();
}
