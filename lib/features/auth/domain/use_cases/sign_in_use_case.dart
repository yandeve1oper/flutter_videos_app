import 'package:flutter_videos_app/common/domian/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  // The primary role of a use case is to orchestrate the execution of
  // a specific business operation. They coordinate the flow of data
  // to and from entities by interacting with repositories.
  Future<bool> call() async {
    try {
      await authRepository.googleSignIn();

      return true;
    } catch (error) {
      throw Exception(error);
    }
  }
}
