import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setask/settings/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("locale cubit", () {
    late LocaleCubit localeCubit;
    WidgetsFlutterBinding.ensureInitialized();
    setUp(() async {
      localeCubit = LocaleCubit();
      SharedPreferences.setMockInitialValues({});
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('lang', "en");
    });

    tearDown(() {
      localeCubit.close();
    });

    test("the initial state is ru", () {
      expect(localeCubit.state, SelectedLocale(Locale("en")));
    });
    blocTest<LocaleCubit, LocaleState>(
      'emits [MyState] when MyEvent is added.',
      build: () => localeCubit,
      act: (cubit) => cubit.changeLang("ru"),
      expect: () => [SelectedLocale(Locale("ru", ''))],
    );

    blocTest<LocaleCubit, LocaleState>(
      ' when MyEvent is added.',
      build: () => localeCubit,
      act: (cubit) => cubit.changeStartLang(),
      expect: () => [SelectedLocale(Locale("en", ''))],
    );
  });
}
