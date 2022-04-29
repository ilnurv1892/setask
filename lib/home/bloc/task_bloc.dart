import 'package:bloc/bloc.dart';
import 'package:domain/task_repository.dart';
import 'package:equatable/equatable.dart';

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
    await emit.forEach<List<TaskModel>>(
      _taskRepository.getTaskList(),
      onData: (data) {
        return state.copyWith(status: () => TaskStatus.success, task: () => data);
      },
    );
  }
}
