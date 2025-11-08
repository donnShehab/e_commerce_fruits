import 'package:e_coomerce_fruit/feature/auth/domain/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
    super.phoneNumber,
  });


  // إنشاء من Firebase User
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      phoneNumber: user.phoneNumber,
    );
  }
    // إنشاء من JSON (التعامل مع البيانات من Firestore أو API)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      uId: json['uId'],
      phoneNumber: json['phoneNumber'],
    );
  }
    // تحويل إلى Map (للحفظ في Firestore أو التخزين المحلي)
  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'phoneNumber': phoneNumber,
    };
  }
  // إنشاء من UserEntity
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      phoneNumber: user.phoneNumber,
    );
  }
}
