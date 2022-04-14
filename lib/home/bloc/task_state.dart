part of 'task_bloc.dart';

enum TaskStatus { initial, loading, success, failure }

class TaskInitial extends Equatable {
  final TaskStatus status;
  final List<Task> task;

  TaskInitial({this.status = TaskStatus.initial, this.task = const []});

  TaskInitial copyWith({
    TaskStatus Function()? status,
    List<Task> Function()? task,
  }) {
    return TaskInitial(
      status: status != null ? status() : this.status,
      task: task != null ? task() : this.task,
    );
  }

  @override
  List<Object?> get props => [task, status];
}
