import 'package:core/core.dart';
import 'package:navigation/src/router/nft_observer_router.dart';

abstract class NavigationDI {
  static void initializeDependencies() {
    serviceLocator.registerSingleton<NFTObserverRouter>(NFTObserverRouter());
  }
}
