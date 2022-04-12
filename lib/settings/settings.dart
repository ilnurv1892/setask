import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setask/settings/cubit/locale_cubit.dart';
import 'package:setask/l10n/l10n.dart';
import 'package:setask/settings/cubit/theme_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  static Route route(LocaleCubit localeCubit, ThemeCubit themeCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: localeCubit,
          ),
          BlocProvider.value(
            value: themeCubit,
          ),
        ],
        child: const Settings(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              TextButton(
                  onPressed: () {
                    context.read<LocaleCubit>().changeLang('ru');
                  },
                  child: Text('ru')),
              TextButton(
                  onPressed: () {
                    context.read<LocaleCubit>().changeLang('en');
                  },
                  child: Text('en')),
              TextButton(
                  onPressed: () {
                    context.read<ThemeCubit>().changeToDark();
                  },
                  child: Text('change to dark')),
              TextButton(
                  onPressed: () {
                    context.read<ThemeCubit>().changeToLight();
                  },
                  child: Text('change to light')),
              // BlocBuilder<ThemeCubit, ThemeState>(
              //   builder: (context, state) {
              //     return Switch(
              //       value: state.isDarkTheme,
              //       onChanged: (newValue) {
              //         context.read<ThemeCubit>().switchTheme(newValue);
              //       },
              //     );
              //   },
              // )
            ],
          )
        ],
      ),
    );
  }
}
