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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blue, width: 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Text(l10n.select_language),
                    title: DropdownButtonFormField<String>(
                      value: context.read<LocaleCubit>().state.locale.languageCode,
                      items: [
                        DropdownMenuItem(
                          child: Text(l10n.russian_language),
                          value: "ru",
                        ),
                        DropdownMenuItem(
                          child: Text(l10n.english_language),
                          value: "en",
                        ),
                      ],
                      onChanged: (value) {
                        context.read<LocaleCubit>().changeLang(value!);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blue, width: 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Text(l10n.change_theme),
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(l10n.light_theme),
                            BlocBuilder<ThemeCubit, ThemeState>(
                              builder: (context, state) {
                                return Switch(
                                  value: state.isDarkTheme,
                                  onChanged: (newValue) {
                                    context.read<ThemeCubit>().switchTheme(newValue);
                                  },
                                );
                              },
                            ),
                            Text(l10n.dark_theme),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
