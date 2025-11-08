import 'package:dartz/dartz.dart';
import 'package:e_coomerce_fruit/core/errors/failures.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  // sign up
 Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String? phoneNumber,
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
  // save user data to shared preferences
  Future saveUserData({required UserEntity user});
  // get user data from firestore
  Future<UserEntity> getUserData({required String uid});
  // إرسال OTP لإعادة تعيين كلمة المرور عبر الهاتف

  Future<Either<Failure, String>> sendOtpForPasswordReset(String phoneNumber);

  // التحقق من OTP وإعادة تعيين كلمة المرور

  Future<Either<Failure, UserEntity>> verifyOtpAndResetPassword(
    String verificationId,
    String otp,
    String newPassword,
  );
}
