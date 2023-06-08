import 'package:auto_route/auto_route.dart';
import 'package:my_portfolio/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SkillsRoute.page, path: '/skills'),
      ];
}
