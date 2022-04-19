import 'package:firebase_repository/authentication_repository.dart';

/// {@template task_repository}
/// repository for tasks
/// {@endtemplate}
class TaskRepository {
  /// {@macro task_repository}
  const TaskRepository({
    required this.taskApi,
  });

  final TaskApi taskApi;

  Stream<List<TaskModel>> getTaskList() => taskApi.getTask();
}
