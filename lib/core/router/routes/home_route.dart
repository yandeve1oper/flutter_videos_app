part of 'routes.dart';

class HomeRoute extends ShellRoute {
  HomeRoute() : super(navigatorKey: _shellNavigatorKey, routes: _homeRoutes);

  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static List<RouteBase> get _homeRoutes => [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: HomePages.root.path,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: HomePages.profile.path,
          builder: (context, state) => const ProfilePage(),
        ),
      ];

  @override
  ShellRouteBuilder? get builder => (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: AppBottomNavBar(),
        );
      };
}
