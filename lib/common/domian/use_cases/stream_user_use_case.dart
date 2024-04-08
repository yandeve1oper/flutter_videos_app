import 'package:flutter_videos_app/common/domian/entities/user_entity.dart';
import 'package:flutter_videos_app/common/domian/repositories/auth_repository.dart';

class StreamUserUseCase {
  final AuthRepository authRepository;

  StreamUserUseCase({required this.authRepository});

  Stream<UserEntity> call() {
    try {
      return authRepository.user;
    } catch (error) {
      throw Exception(error);
    }
  }
}
