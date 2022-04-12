import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(SelectedTheme(ThemeData(), false));

  void changeToLight() async {
    emit(SelectedTheme(ThemeData.light(), false));
  }

  void changeToDark() async {
    emit(SelectedTheme(ThemeData.dark(), true));
  }

  // void switchTheme(bool newValue) {
  //   state.isDarkTheme = !state.isDarkTheme;
  // }
}
