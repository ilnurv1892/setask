import 'package:domain/task_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_data/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setask/app/bloc_observer.dart';
import 'package:setask/app/view/app.dart';
import 'package:setask/firebase_options.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final authenticationRepository = AuthenticationRepositoryIml();
      await authenticationRepository.user.first;

      final taskRepository = TaskRepositoryImpl();
      final userRepository = UserRepositoryIml();

      runApp(App(
        authenticationRepository: authenticationRepository,
        taskRepository: taskRepository,
        userRepository: userRepository,
      ));
    },
    blocObserver: AppBlocObserver(),
  );
}
