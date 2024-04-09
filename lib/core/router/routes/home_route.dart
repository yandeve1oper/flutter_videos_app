part of 'routes.dart';

class HomeRoute extends ShellRoute {
  HomeRoute({
    required GlobalKey<NavigatorState> rootNavigatorKey,
  }) : super(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                path: HomePages.root.path,
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: HomePages.videoDetails.path,
                    builder: (context, state) {
                      final file = state.extra as VideoFileEntity?;

                      return VideoDetailsPage(file: file);
                    },
                  )
                ]),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: HomePages.profile.path,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        );

  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  ShellRouteBuilder? get builder => (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: AppBottomNavBar(),
        );
      };
}
