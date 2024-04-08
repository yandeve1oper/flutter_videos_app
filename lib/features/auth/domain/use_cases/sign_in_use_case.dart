import 'package:flutter_videos_app/common/domian/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<bool> call() async {
    try {
      await authRepository.googleSignIn();

      return true;
    } catch (error) {
      throw Exception(error);
    }
  }
}
