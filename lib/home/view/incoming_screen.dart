import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setask/home/bloc/task_bloc.dart';
import 'package:task_repository/task_repository.dart';

class IncomingScreen extends StatelessWidget {
  const IncomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(
        context.read<TaskRepository>(),
      )..add(const TaskViewSubscriptionRequest()),
      child: BlocListener<TaskBloc, TaskInitial>(
        listener: (context, state) {
          print(state.task[0].owner);
        },
        child: BlocBuilder<TaskBloc, TaskInitial>(
          builder: (context, state) {
            if (state.status == TaskStatus.success) {
              return Center(
                child: ListView(children: [
                  ...state.task.map((e) => Text(e.owner.toString())).toList(),
                  ...state.task.map((e) => Text(e.team.toString())).toList(),
                  ...state.task.map((e) => Text(e.title.toString())).toList(),
                  ...state.task.map((e) => Text(e.uid.toString())).toList(),
                ]),
              );
            }

            return Center(
              child: Text("empty"),
            );
          },
        ),
      ),
    );
  }
}
