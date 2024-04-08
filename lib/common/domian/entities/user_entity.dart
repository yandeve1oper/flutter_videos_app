import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? name;
  final String? photoURL;
  final String? email;

  const UserEntity({
    required this.id,
    this.name,
    this.photoURL,
    this.email,
  });

  static const UserEntity empty = UserEntity(
    id: '',
    name: '',
    photoURL: '',
    email: '',
  );

  bool get isEmpty => this == UserEntity.empty;

  @override
  List<Object?> get props => [id, name, photoURL, email];
}
