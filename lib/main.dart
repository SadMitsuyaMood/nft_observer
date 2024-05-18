import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_observer/firebase_options.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };

    runApp(const MyApp());
  }, (Object error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SizedBox.shrink(),
    );
  }
}
