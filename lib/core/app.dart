import 'package:flutter/material.dart';

import 'package:flutter_videos_app/core/utils/snackbar.dart';

import 'router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
