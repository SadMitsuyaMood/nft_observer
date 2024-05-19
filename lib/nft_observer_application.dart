import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation/navigation.dart';

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

class _NFTObserverApplication extends StatefulWidget {
  @override
  State<_NFTObserverApplication> createState() => _NFTObserverApplicationState();
}

class _NFTObserverApplicationState extends State<_NFTObserverApplication> {
  final NavigatorObservers navigatorObservers = NavigatorObservers();
  late final NFTObserverRouter router;

  @override
  void initState() {
    super.initState();
    router = serviceLocator<NFTObserverRouter>();
  }

  @override
  Widget build(BuildContext context) {
    //TODO update with cached logic
    final NFTObserverTheme theme = const LightTheme();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: theme.systemUiOverlayStyle,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: theme.themeData,
        routerConfig: router.config(
          navigatorObservers: () => <NavigatorObserver>[navigatorObservers.firebaseAnalytics],
        ),
      ),
    );
  }
}
