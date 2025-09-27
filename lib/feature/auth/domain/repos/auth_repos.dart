import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/feature/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  // sign up
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  // sign in
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  // sign in with google
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  // sign in whith facebook
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  // add user data to firestore
  Future addUserData({required UserEntity user});
  // get user data from firestore
  Future<UserEntity> getUserData({required String uid});
}
