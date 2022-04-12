part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  ThemeState({this.isDarkTheme = false}) {
    if (isDarkTheme) {
      theme = ThemeData.dark();
    }
    if (!isDarkTheme) {
      theme = ThemeData.light();
    }
  }

  late ThemeData theme;
  final bool isDarkTheme;

  @override
  List<Object> get props => [theme];

  ThemeState copyWith({
    bool? isDarkTheme,
  }) {
    return ThemeState(isDarkTheme: isDarkTheme!);
  }
}
