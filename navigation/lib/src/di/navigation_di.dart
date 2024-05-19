import 'package:core/core.dart';
import 'package:navigation/src/router/router.dart';

abstract class NavigationDI {
  static void initializeDependencies() {
    serviceLocator.registerSingleton<NFTObserverRouter>(NFTObserverRouter());
  }
}
