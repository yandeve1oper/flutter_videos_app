part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final UserEntity? user;

  const AuthState({this.user});

  AuthState copyWith({UserEntity? user}) {
    return AuthState(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}
