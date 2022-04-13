import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setask/app/bloc/app_bloc.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Center(
      child: Text(user.email.toString()),
    );
  }
}
