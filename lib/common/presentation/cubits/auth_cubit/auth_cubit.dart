import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_videos_app/common/domian/entities/user_entity.dart';
import 'package:flutter_videos_app/common/domian/use_cases/sign_out_use_case.dart';
import 'package:flutter_videos_app/common/domian/use_cases/stream_user_use_case.dart';
import 'package:flutter_videos_app/features/auth/domain/use_cases/sign_in_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;

  late final StreamSubscription _userSubscription;

  AuthCubit({
    required SignInUseCase signInUseCase,
    required SignOutUseCase signOutUseCase,
    required StreamUserUseCase streamUserUseCase,
  })  : _signInUseCase = signInUseCase,
        _signOutUseCase = signOutUseCase,
        super(const AuthState()) {
    _init(streamUserUseCase);
  }

  void _init(StreamUserUseCase streamUserUseCase) {
    _userSubscription = streamUserUseCase.call().listen(_setUser);
  }

  void _setUser(UserEntity value) {
    emit(state.copyWith(user: value));
  }

  @override
  Future<void> close() async {
    _userSubscription.cancel();
    return super.close();
  }

  Future<void> signIn() async {
    _signInUseCase.call();
  }

  Future<void> signOut() async {
    _signOutUseCase.call();
  }
}
