import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_videos_app/common/data/mappers/entity_convertable.dart';
import 'package:flutter_videos_app/common/domian/entities/user_entity.dart';

class UserModel with EntityConvertable<UserModel, dynamic> {
  final String? id;
  final String? name;
  final String? photoURL;
  final String? email;

  const UserModel({
    this.id,
    this.name,
    this.photoURL,
    this.email,
  });

  @override
  factory UserModel.fromFirebaseModel(User firebaseModel) => UserModel(
      id: firebaseModel.uid,
      name: firebaseModel.displayName,
      photoURL: firebaseModel.photoURL,
      email: firebaseModel.email);

  @override
  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        photoURL: photoURL,
        email: email,
      );
}
