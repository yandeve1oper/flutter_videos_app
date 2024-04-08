import 'package:flutter_videos_app/common/domian/entities/user_entity.dart';

abstract class AuthRepository {
  Stream<UserEntity> get user;

  Future<UserEntity> googleSignIn();

  Future<void> signOut();
}
