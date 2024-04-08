import 'package:flutter_videos_app/common/domian/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository authRepository;

  SignOutUseCase({required this.authRepository});

  Future<void> call() => authRepository.signOut();
}
