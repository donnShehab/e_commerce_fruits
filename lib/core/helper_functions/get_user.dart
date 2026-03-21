import 'dart:convert';

import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/feature/auth/data/models/user_models.dart';
import 'package:fruit_hub/feature/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
// UserEntity getUser() {
//   var jsonString = Prefs.getString(kUserData);

//   if (jsonString.isEmpty) {
//     print('⚠️ No saved user data found');
//     return UserEntity(name: '', email: '', uId: '');
//   }

//   try {
//     var userEntity = UserModel.fromJson(jsonDecode(jsonString));
//     return userEntity;
//   } catch (e) {
//     print('❌ Error decoding user data: $e');
//     return UserEntity(name: '', email: '', uId: '');
//   }
// }
