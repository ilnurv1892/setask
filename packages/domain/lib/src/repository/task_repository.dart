import 'package:domain/task_repository.dart';

abstract class TaskRepository {
  Stream<List<TaskModel>> getTaskList();
}
