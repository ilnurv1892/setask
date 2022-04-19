import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setask/app/bloc/app_bloc.dart';
import 'package:setask/home/bloc/user_bloc.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        context.read<UserBloc>().add(FetchEvent(user));
        return Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.user.name.toString()),
            Text(state.user.team_id.toString()),
            Text(state.user.email.toString()),
            Text(state.user.pts.toString()),
            Text(state.user.team_members.toString()),
          ],
        ));
      },
    );
  }
}
