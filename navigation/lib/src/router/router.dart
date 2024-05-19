import 'package:auto_route/auto_route.dart';
import 'package:splash/splash.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
  modules: <Type>[
    SplashModule,
  ],
)
class NFTObserverRouter extends _$NFTObserverRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
      ];
}
