import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation/navigation.dart';
import 'package:nft_observer/firebase_options.dart';
import 'package:nft_observer/nft_observer_application.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await EasyLocalization.ensureInitialized();

    await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

    NavigationDI.initializeDependencies();

    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };

    runApp(NFTObserverApplication());
  }, (Object error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
