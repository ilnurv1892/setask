part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class TaskViewSubscriptionRequest extends TaskEvent {
  const TaskViewSubscriptionRequest();
}
