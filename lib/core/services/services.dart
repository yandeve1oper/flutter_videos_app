import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_videos_app/common/data/repositories/auth_repository_impl.dart';
import 'package:flutter_videos_app/common/domian/repositories/auth_repository.dart';
import 'package:flutter_videos_app/common/domian/use_cases/sign_out_use_case.dart';
import 'package:flutter_videos_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:flutter_videos_app/common/domian/use_cases/stream_user_use_case.dart';
import 'package:flutter_videos_app/common/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_videos_app/common/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:flutter_videos_app/firebase_options.dart';

class Services {
  Services();

  static final injector = GetIt.instance;

  static Future<Services> init() async {
    await _initFirebaseServices();
    _initDependencies();

    return Services();
  }

  static Future<void> _initFirebaseServices() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static void _initDependencies() {
    /// Data Sources ///
    injector.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    );

    /// Repositories ///
    injector.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: injector()),
    );

    /// Usecases ///
    injector.registerLazySingleton(
      () => SignInUseCase(authRepository: injector()),
    );
    injector.registerLazySingleton(
      () => SignOutUseCase(authRepository: injector()),
    );
    injector.registerLazySingleton(
      () => StreamUserUseCase(authRepository: injector()),
    );
  }
}
