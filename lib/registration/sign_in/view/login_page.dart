import 'package:domain/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setask/l10n/l10n.dart';
import 'package:setask/registration/sign_in/cubit/login_cubit.dart';
import 'package:setask/registration/sign_in/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.app_title)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationRepository>(), context.read<UserRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
