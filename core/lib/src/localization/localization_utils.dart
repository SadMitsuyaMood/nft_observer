part of localization;

abstract class LocalizationUtils {
  static const String translationsPath = 'assets/translations';

  static const List<Locale> supportedLocales = <Locale>[_enLocale];

  static const Locale defaultLocale = _enLocale;

  static const Locale _enLocale = Locale('en');
}
