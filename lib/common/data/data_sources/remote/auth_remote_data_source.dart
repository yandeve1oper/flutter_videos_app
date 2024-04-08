import 'package:flutter_videos_app/common/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Stream<UserModel?> get user;

  Future<UserModel> googleSignIn();

  Future<void> signOut();
}
