import 'package:flutter_videos_app/features/home/data/data_sources/remote/videos_remote_data_source.dart';
import 'package:flutter_videos_app/features/home/data/data_sources/remote/videos_remote_data_source_fake.dart';
import 'package:flutter_videos_app/features/home/data/repositories/videos_repository_impl.dart';
import 'package:flutter_videos_app/features/home/domain/repositories/videos_repository.dart';
import 'package:flutter_videos_app/features/home/domain/use_cases/get_videos_use_case.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_videos_app/common/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_videos_app/common/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:flutter_videos_app/common/data/repositories/auth_repository_impl.dart';
import 'package:flutter_videos_app/common/domian/repositories/auth_repository.dart';
import 'package:flutter_videos_app/common/domian/use_cases/sign_out_use_case.dart';
import 'package:flutter_videos_app/common/domian/use_cases/stream_user_use_case.dart';
import 'package:flutter_videos_app/features/auth/domain/use_cases/sign_in_use_case.dart';

import 'thumbnail_service.dart';

final injector = GetIt.instance;

void initDependencies() {
  /// Services ///
  injector.registerLazySingleton(() => ThumbnailService());

  /// Data Sources ///
  injector.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  injector.registerLazySingleton<VideosRemoteDataSource>(
    () => VideosRemoteDataSourceFake(thumbnailService: injector()),
  );

  /// Repositories ///
  injector.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: injector()),
  );
  injector.registerLazySingleton<VideosRepository>(
    () => VideosRepositoryImpl(remoteDataSource: injector()),
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
  injector.registerLazySingleton(
    () => GetVideosUseCase(videosRepository: injector()),
  );
}
