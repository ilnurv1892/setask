import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDarkTheme: true));

  void changeStartTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDarkTheme = prefs.getBool('theme');
    if (isDarkTheme != null) {
      emit(state.copyWith(isDarkTheme: isDarkTheme));
    }
  }

  Future<void> switchTheme(bool newValue) async {
    emit(state.copyWith(isDarkTheme: newValue));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme', newValue);
  }
}
