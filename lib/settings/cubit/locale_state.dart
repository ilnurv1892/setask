part of 'locale_cubit.dart';

abstract class LocaleState extends Equatable {
  final Locale locale;

  LocaleState(this.locale);
}

class SelectedLocale extends LocaleState {
  SelectedLocale(Locale locale) : super(locale);

  @override
  List<Object> get props => [locale];
}
