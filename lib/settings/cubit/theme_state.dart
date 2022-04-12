part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  ThemeState(this.theme);
  final ThemeData theme;

  @override
  List<Object> get props => [theme];

  // bool isDarkTheme = false;
}

class SelectedTheme extends ThemeState {
  SelectedTheme(ThemeData theme, isDarkTheme) : super(theme);
}
