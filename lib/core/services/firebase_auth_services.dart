import 'dart:developer';
import 'dart:io';

import 'package:e_coomerce_fruit/core/errors/exception.dart';
import 'package:e_coomerce_fruit/core/services/storage_service.dart';
import 'package:e_coomerce_fruit/core/services/shared_preferences_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  // delete user
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  // create user
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(
        message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }

  // sign in user
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(
        message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }

  // sign in user with google

  // Future<User> signInWithGoogle() async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     // Once signed in, return the UserCredential
  //     return (await FirebaseAuth.instance.signInWithCredential(
  //       credential,
  //     )).user!;
  //   } catch (e) {
  //     log("Exception in FirebaseAuthService.signInWithGoogle: ${e.toString()}");

  //     throw CustomException(
  //       message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
  //     );
  //   }
  // }

  //////

  Future<User> signInWithGoogle() async {
    try {
      print('🔹 بدء عملية تسجيل الدخول عبر Google...');

      // 1️⃣ فتح نافذة تسجيل الدخول بجوجل
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print('✅ بعد GoogleSignIn().signIn()');

      if (googleUser == null) {
        print('⚠️ المستخدم ألغى عملية تسجيل الدخول.');
        throw CustomException(
          message: 'تم إلغاء تسجيل الدخول من قبل المستخدم.',
        );
      }

      // 2️⃣ الحصول على بيانات التوثيق من Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print('✅ تم الحصول على googleAuth: ${googleAuth.idToken != null}');

      // 3️⃣ إنشاء credential من Google
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print('✅ تم إنشاء credential بنجاح.');

      // 4️⃣ تسجيل الدخول إلى Firebase باستخدام credential
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      print('✅ تسجيل الدخول في Firebase تم بنجاح.');

      // 5️⃣ طباعة بيانات المستخدم
      print('👤 اسم المستخدم: ${userCredential.user?.displayName}');
      print('📧 البريد الإلكتروني: ${userCredential.user?.email}');
      print('🆔 UID: ${userCredential.user?.uid}');

      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      print('❌ FirebaseAuthException: ${e.code}');
      throw CustomException(message: 'حدث خطأ في Firebase: ${e.code}');
    } catch (e) {
      print('❌ خطأ غير متوقع في signInWithGoogle: $e');
      throw CustomException(
        message: 'لقد حدث خطأ ما أثناء تسجيل الدخول بجوجل.',
      );
    }
  }

  // sign in user with facebook
  Future<User> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      return (await FirebaseAuth.instance.signInWithCredential(
        facebookAuthCredential,
      )).user!;
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithFacebook: ${e.toString()}",
      );

      throw CustomException(
        message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  // إرسال OTP لإعادة تعيين كلمة المرور عبر الهاتف
  Future<void> sendOtp(String phoneNumber, Function(String) onCodeSent) async {
    try {
      print('📱 بدء إرسال OTP لرقم الهاتف: $phoneNumber');
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('✅ التحقق التلقائي تم (Android فقط)');
          await FirebaseAuth.instance.signInWithCredential(credential);
        },

        verificationFailed: (FirebaseAuthException e) {
          print('❌ فشل التحقق: ${e.message}');
          throw CustomException(message: 'فشل إرسال OTP: ${e.message}');
        },

        codeSent: (String verificationId, int? resendToken) {
          print('📨 تم إرسال OTP، verificationId: $verificationId');
          onCodeSent(
            verificationId,
          ); // إرجاع verificationId للاستخدام في التحقق
        },

        codeAutoRetrievalTimeout: (String verificationId) {
          print(
            '⏰ انتهت مهلة الاسترجاع التلقائي، verificationId: $verificationId',
          );

          onCodeSent(verificationId);
        },
      );
    } catch (e) {
      log('Exception in FirebaseAuthService.sendOtp: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ أثناء إرسال OTP.');
    }
  }

  // التحقق من OTP وتسجيل الدخول المؤقت
  Future<UserCredential> verifyOtpAndSignIn(
    String verificationId,
    String otp,
  ) async {
    try {
      print('🔍 التحقق من OTP: $otp مع verificationId: $verificationId');

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      print('✅ تسجيل الدخول المؤقت نجح للمستخدم: ${userCredential.user?.uid}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('❌ خطأ في التحقق من OTP: ${e.code}');
      throw CustomException(message: 'OTP غير صحيح أو منتهي الصلاحية.');
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.verifyOtpAndSignIn: ${e.toString()}',
      );
      throw CustomException(message: 'حدث خطأ أثناء التحقق من OTP.');
    }
  }
}
