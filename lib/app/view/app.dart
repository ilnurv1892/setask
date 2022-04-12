import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:setask/app/bloc/app_bloc.dart';
import 'package:setask/settings/cubit/locale_cubit.dart';
import 'package:setask/app/routes/routes.dart';
import 'package:setask/settings/cubit/theme_cubit.dart';
import 'package:setask/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LocaleCubit>(
            create: (BuildContext context) => LocaleCubit()..changeStartLang(),
          ),
          BlocProvider<AppBloc>(
            create: (BuildContext context) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit(),
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
