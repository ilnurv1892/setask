import 'package:firebase_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:setask/app/bloc/app_bloc.dart';
import 'package:setask/settings/cubit/locale_cubit.dart';
import 'package:setask/app/routes/routes.dart';
import 'package:setask/settings/cubit/theme_cubit.dart';
import 'package:setask/l10n/l10n.dart';
import 'package:task_repository/task_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
    required this.taskRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final TaskRepository taskRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
        RepositoryProvider.value(
          value: taskRepository,
        ),
        RepositoryProvider.value(value: userRepository)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LocaleCubit>(
            create: (BuildContext context) => LocaleCubit()..changeStartLang(),
          ),
          BlocProvider<AppBloc>(
            create: (BuildContext context) => AppBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit()..changeStartTheme(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return BlocBuilder<LocaleCubit, LocaleState>(
              buildWhen: (previousState, currentState) => previousState != currentState,
              builder: (context, lang) {
                return MaterialApp(
                  theme: state.theme,
                  home: FlowBuilder<AppStatus>(
                    state: context.select((AppBloc bloc) => bloc.state.status),
                    onGeneratePages: onGenerateAppViewPages,
                  ),
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en', ''),
                    Locale('ru', ''),
                  ],
                  locale: lang.locale,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
