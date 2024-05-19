library theme;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'icons.dart';

part 'palette.dart';

part 'text_styles.dart';

abstract class NFTObserverTheme {
  static NFTObserverTheme of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    switch (brightness) {
      case Brightness.dark:
        return const DarkTheme();
      case Brightness.light:
        return const LightTheme();
    }
  }

  ThemeData get themeData;

  SystemUiOverlayStyle get systemUiOverlayStyle;

  Color get black;

  Color get white;

  Color get transparent;
}

class DarkTheme implements NFTObserverTheme {
  const DarkTheme();

  @override
  ThemeData get themeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: NFTObserverPalette.pureBlack,
          brightness: Brightness.dark,
          background: NFTObserverPalette.pureBlack,
        ),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(systemOverlayStyle: _systemUiOverlayStyle),
        useMaterial3: true,
      );

  @override
  SystemUiOverlayStyle get systemUiOverlayStyle => _systemUiOverlayStyle;

  @override
  Color get black => NFTObserverPalette.pureBlack;

  @override
  Color get white => NFTObserverPalette.pureWhite;

  @override
  Color get transparent => NFTObserverPalette.transparent;

  static const SystemUiOverlayStyle _systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: NFTObserverPalette.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: NFTObserverPalette.pureBlack,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}

class LightTheme implements NFTObserverTheme {
  const LightTheme();

  @override
  ThemeData get themeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: NFTObserverPalette.pureWhite,
          background: NFTObserverPalette.pureWhite,
        ),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(systemOverlayStyle: _systemUiOverlayStyle),
        useMaterial3: true,
      );

  @override
  SystemUiOverlayStyle get systemUiOverlayStyle => _systemUiOverlayStyle;

  @override
  Color get black => NFTObserverPalette.pureBlack;

  @override
  Color get white => NFTObserverPalette.pureWhite;

  @override
  Color get transparent => NFTObserverPalette.transparent;

  static const SystemUiOverlayStyle _systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: NFTObserverPalette.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: NFTObserverPalette.pureWhite,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
