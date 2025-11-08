import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/errors/exception.dart';
import 'package:e_coomerce_fruit/core/errors/failures.dart';
import 'package:e_coomerce_fruit/core/services/database_service.dart';
import 'package:e_coomerce_fruit/core/services/firebase_auth_services.dart';
import 'package:e_coomerce_fruit/core/services/shared_preferences_singleton.dart';
import 'package:e_coomerce_fruit/core/utils/backend_endpoint.dart';
import 'package:e_coomerce_fruit/core/utils/phone_utils.dart';
import 'package:e_coomerce_fruit/feature/auth/data/models/user_models.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/entites/user_entity.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/repos/auth_repos.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  // @override
  // Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
  //   String email,
  //   String password,
  //   String name,
  // ) async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthServices.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     var userEntity = UserEntity(name: name, email: email, uId: user.uid);
  //     await addUserData(user: userEntity);
  //     return right(userEntity);
  //   } on CustomException catch (e) {
  //     await deleteUser(user);
  //     return left(ServerFailure(message: e.message));
  //   } catch (e) {
  //     deleteUser(user);
  //     log(
  //       'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
  //     );
  //     return left(
  //       ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
  //     );
  //   }
  // }
  // signup
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String? phoneNumber,
  ) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
        phoneNumber: phoneNumber,
      );
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
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

  // sign in with email and password
  // @override
  // Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     var user = await firebaseAuthServices.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     UserEntity userEntity;
  //     try {
  //       userEntity = await getUserData(uid: user.uid);
  //     } catch (e) {
  //       // fallback إذا لم توجد بيانات في Firestore
  //       userEntity = UserModel.fromFirebaseUser(user);
  //     }

  //     return right(userEntity);
  //   } on CustomException catch (e) {
  //     return left(ServerFailure(message: e.message));
  //   } catch (e) {
  //     return left(
  //       ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة أخرى.'),
  //     );
  //   }
  // }

  // signin

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
      // Get user data from Firestore
      var userEntity = await getUserData(uid: user.uid);
      // Save user data locally
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
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
  // sign in with google
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
      await saveUserData(user: userEntity);

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

  // @override
  //   Future<Either<Failure, UserEntity>> signInWithGoogle() async {
  //     User? user;
  //     try {
  //       // تسجيل الدخول بجوجل
  //       user = await firebaseAuthServices.signInWithGoogle();

  //       // تحويل بيانات المستخدم من Firebase إلى كائن UserEntity
  //       var userEntity = UserModel.fromFirebaseUser(user);

  //       // تحقق هل المستخدم موجود في قاعدة البيانات (Firestore)
  //       var isUserExist = await dataBaseService.checkIfDataExists(
  //         path: BackendEndpoint.isUserExists,
  //         documentId: user.uid,
  //       );

  //       if (isUserExist) {
  //         // ✅ لو المستخدم موجود، جيب بياناته من Firestore

  //         // userEntity = await getUserData(uid: user.uid);
  //         userEntity = await getUserData(uid: user.uid);
  //       } else {
  //         // ✅ لو جديد، أضف بياناته إلى Firestore
  //         await addUserData(user: userEntity);
  //       }

  //       // ✅ في الحالتين، احفظ بياناته محليًا علشان الاسم يظهر في التطبيق
  //       await saveUserData(user: userEntity);

  //       return right(userEntity);
  //     } catch (e) {
  //       await deleteUser(user);
  //       log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
  //       return left(
  //         ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
  //       );
  //     }
  //   }

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
      data: UserModel.fromEntity(user).toMap(),
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

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }

  // إرسال OTP لإعادة تعيين كلمة المرور عبر الهاتف
  Future<Either<Failure, String>> sendOtpForPasswordReset(
    String phoneNumber,
  ) async {
    try {
      // Normalize the phone number for consistent storage and lookup
      String normalizedPhone = formatPhoneForFirebase(phoneNumber);

      var userData = await dataBaseService.getDataWhere(
        path: BackendEndpoint.getUserData,
        query: {'phoneNumber': normalizedPhone},
      );

      if (userData.isEmpty) {
        return left(ServerFailure(message: 'رقم الهاتف غير مسجل.'));
      }

      // إرسال OTP
      String verificationId = '';
      await firebaseAuthServices.sendOtp(
        normalizedPhone,
        (id) => verificationId = id,
      );
      return right(verificationId);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('Exception in sendOtpForPasswordReset: $e');
      return left(ServerFailure(message: 'حدث خطأ.'));
    }
  }

  // التحقق من OTP وإعادة تعيين كلمة المرور

  @override
  Future<Either<Failure, UserEntity>> verifyOtpAndResetPassword(
    String verificationId,

    String otp,

    String newPassword,
  ) async {
    try {
      // التحقق من OTP وتسجيل الدخول المؤقت

      UserCredential userCredential = await firebaseAuthServices
          .verifyOtpAndSignIn(verificationId, otp);

      // الحصول على بيانات المستخدم من Firestore

      var userEntity = await getUserData(uid: userCredential.user!.uid);

      // تحديث كلمة المرور في Firebase Auth

      await userCredential.user!.updatePassword(newPassword);

      // حفظ البيانات محليًا

      await saveUserData(user: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.verifyOtpAndResetPassword: ${e.toString()}',
      );

      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }
}
