import 'package:flutter_videos_app/common/domian/entities/user_entity.dart';
import 'package:flutter_videos_app/common/domian/repositories/auth_repository.dart';

import '../data_sources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<UserEntity> get user {
    return remoteDataSource.user.map(
      (user) => user == null ? UserEntity.empty : user.toEntity(),
    );
  }

  @override
  Future<UserEntity> googleSignIn() async {
    final user = await remoteDataSource.googleSignIn();

    return user.toEntity();
  }

  @override
  Future<void> signOut() => remoteDataSource.signOut();
}
