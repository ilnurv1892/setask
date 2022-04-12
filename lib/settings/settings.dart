import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setask/app/cubit/locale_cubit.dart';
import 'package:setask/l10n/l10n.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  static Route route(LocaleCubit localeCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: localeCubit,
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
            ],
          )
        ],
      ),
    );
  }
}
