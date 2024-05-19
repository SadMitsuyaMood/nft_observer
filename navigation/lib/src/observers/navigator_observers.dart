import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NavigatorObservers {
  FirebaseAnalyticsObserver get firebaseAnalytics => FirebaseAnalyticsObserver(
        analytics: FirebaseAnalytics.instance,
        routeFilter: _routeFilter,
      );

  bool _routeFilter(Route<dynamic>? route) {
    return route is PageRoute || route is ModalBottomSheetRoute<dynamic> || route is DialogRoute<dynamic>;
  }
}
