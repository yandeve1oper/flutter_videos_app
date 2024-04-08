import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_videos_app/core/router/pages.dart';
import 'package:flutter_videos_app/features/auth/presentation/auth_page.dart';

import 'routes/routes.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static String? _redirectIfNotAuthenticated(
    BuildContext context,
    GoRouterState state,
  ) {
    // TODO: Complete logic later
    const profile = null;

    return profile == null ? RootPages.auth.path : null;
  }

  static final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    redirect: _redirectIfNotAuthenticated,
    initialLocation: RootPages.home.path,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RootPages.auth.path,
        builder: (context, state) => const AuthPage(),
      ),
      HomeRoute(),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Not found'),
      ),
    ),
  );

  static GoRouter get router => _router;
}
