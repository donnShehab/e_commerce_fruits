import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exception.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_services.dart';
import 'package:fruit_hub/feature/auth/data/models/user_models.dart';
import 'package:fruit_hub/feature/auth/domain/entites/user_entity.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repos.dart';
import 'package:fruit_hub/utils/backend_endpoint.dart';

// i need add comment there all file up methods in arabic
class AuthRepoImpl extends AuthRepo {
  // dependencies
  // firebase auth services
  final FirebaseAuthService firebaseAuthServices;
  // firestore services
  final DataBaseService dataBaseService;
  // add print       print("✅ AuthRepoImpl initialized with dataBaseService: $dataBaseService");

  AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.dataBaseService,
  }) {
    print("✅ AuthRepoImpl initialized with dataBaseService: $dataBaseService");
  }

  // create user with email and password
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  // sign in with email and password
@override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserEntity userEntity;
      try {
        userEntity = await getUserData(uid: user.uid);
      } catch (e) {
        // fallback إذا لم توجد بيانات في Firestore
        userEntity = UserModel.fromFirebaseUser(user);
      }

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }


  // sign in with google
  // @override
  // Future<Either<Failure, UserEntity>> signInWithGoogle() async {
  //   User? user;
  //   try {
  //     // sign in user in firebase auth
  //     user = await firebaseAuthServices.signInWithGoogle();
  //     // return userEntity
  //     var userEntity = UserModel.fromFirebaseUser(user);
  //     var isUserExists = await dataBaseService.checkIfDataExists(
  //       path: BackendEndpoint.isUserExists,
  //       documentId: user.uid,
  //     );
  //     if (isUserExists) {
  //     await getUserData(uid: user.uid);
  //     } else {
  //       await addUserData(user: userEntity);
  //     }
  //     return right(userEntity);
  //   }
  //   // catch custom exception
  //   // on CustomException catch (e) {
  //   //   await deleteUser(user);
  //   //   return left(ServerFailure(message: e.message));
  //   // }
  //   catch (e) {
  //     await deleteUser(user);
  //     log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
  //     return left(
  //       ServerFailure(message: 'حدث خطأ ما . الرجاء المحاولة مرة اخرة'),
  //     );
  //   }
  // }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await dataBaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  // sign in with facebook
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return left(
        ServerFailure(message: 'حدث خطأ ما . الرجاء المحاولة مرة اخرة'),
      );
    }
  }

  // add user data to firestore
  @override
  Future addUserData({required UserEntity user}) async {
    // throw CustomException(message: 'Something went wrong');
    // call firestore service to add user data
    await dataBaseService.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
    );
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dataBaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }
}
