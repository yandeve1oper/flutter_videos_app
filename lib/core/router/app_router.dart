import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_videos_app/common/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_videos_app/core/router/pages.dart';
import 'package:flutter_videos_app/features/auth/presentation/auth_page.dart';

import 'routes/routes.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static String? _redirect(BuildContext context, GoRouterState state) {
    final user = context.read<AuthCubit>().state.user;
    final isUserEmpty = user?.isEmpty ?? true;

    final location = state.matchedLocation;
    final isAuthPath = location == RootPages.auth.path;

    if (isAuthPath && !isUserEmpty) {
      return RootPages.home.path;
    }

    return isUserEmpty ? RootPages.auth.path : null;
  }

  static final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    redirect: _redirect,
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
