import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_task_data_api/firebase_task_data_api.dart';
import 'package:task_repository/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskInitial> {
  TaskBloc(this._taskRepository) : super(TaskInitial()) {
    on<TaskViewSubscriptionRequest>(_onSubscriptionRequested);
  }
  final TaskRepository _taskRepository;

  Future<void> _onSubscriptionRequested(
    TaskViewSubscriptionRequest event,
    Emitter<TaskInitial> emit,
  ) async {
    await emit.forEach<List<Task>>(
      _taskRepository.getTaskList(),
      onData: (data) {
        return state.copyWith(status: () => TaskStatus.success, task: () => data);
      },
    );
  }
}
