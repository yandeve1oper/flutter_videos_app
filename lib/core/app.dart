import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_videos_app/common/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter_videos_app/core/services/services.dart';
import 'package:flutter_videos_app/core/utils/snackbar.dart';

import 'router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        signInUseCase: Services.injector(),
        signOutUseCase: Services.injector(),
        streamUserUseCase: Services.injector(),
      ),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) => AppRouter.router.refresh(),
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          scaffoldMessengerKey: scaffoldMessengerKey,
        ),
      ),
    );
  }
}
