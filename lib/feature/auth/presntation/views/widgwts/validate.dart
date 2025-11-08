import 'package:e_coomerce_fruit/core/utils/phone_utils.dart';

class Validate {
  // Validate Name
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    } else if (value.trim().length < 3) {
      return 'الاسم يجب أن يكون 3 أحرف على الأقل';
    }
    return null;
  }

  // Validate Email
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    } else if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(value.trim())) {
      return 'البريد الإلكتروني غير صالح';
    }
    return null;
  }

  // Validate Password
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    } else if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    } else if (!RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على رمز واحد على الأقل';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    final normalized = formatPhoneForFirebase(value);
    if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(normalized)) {
      return 'رقم الهاتف غير صالح';
    }
    return null;
  }
}
