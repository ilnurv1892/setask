import 'package:firebase_task_data_api/firebase_task_data_api.dart';

/// {@template task_repository}
/// repository for tasks
/// {@endtemplate}
class TaskRepository {
  /// {@macro task_repository}
  const TaskRepository({
    required this.taskApi,
  });

  final TaskApi taskApi;

  Stream<List<Task>> getTaskList() => taskApi.getTask();
}
