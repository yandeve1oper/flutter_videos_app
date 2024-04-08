import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_videos_app/common/data/models/user_model.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }

      return UserModel.fromFirebaseModel(firebaseUser);
    });
  }

  @override
  Future<UserModel> googleSignIn() async {
    final authProvider = GoogleAuthProvider().addScope('profile');

    try {
      final credential = await _firebaseAuth.signInWithProvider(authProvider);

      if (credential.user == null) {
        throw Exception('Sign in failed: The user is null after sign in.');
      }

      return UserModel.fromFirebaseModel(credential.user!);
    } catch (error) {
      throw Exception('Sign in failed: $error');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }
}
