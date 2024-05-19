import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NFTObserverApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocalizationUtils.supportedLocales,
      path: LocalizationUtils.translationsPath,
      fallbackLocale: LocalizationUtils.defaultLocale,
      //TODO add check for a current selected locale, if it's empty set a device locale
      startLocale: LocalizationUtils.defaultLocale,
      assetLoader: const CodegenLoader(),
      saveLocale: false,
      child: _NFTObserverApplication(),
    );
  }
}

class _NFTObserverApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //TODO update Theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Text(LocaleKeys.language.tr()),
        ),
      ),
    );
  }
}
