// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "agreeTerms": MessageLookupByLibrary.simpleMessage(
      "You must agree to the terms and conditions",
    ),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "createAccount": MessageLookupByLibrary.simpleMessage("Create New Account"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "enterCode": MessageLookupByLibrary.simpleMessage(
      "Enter the code sent to your phone number",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error."),
    "errorOccurred": MessageLookupByLibrary.simpleMessage(
      "An error occurred. Please try again.",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "newAccount": MessageLookupByLibrary.simpleMessage("New Account"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Password has been reset successfully!",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNotRegistered": MessageLookupByLibrary.simpleMessage(
      "Phone number not registered.",
    ),
    "requiredField": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "resetInstructions": MessageLookupByLibrary.simpleMessage(
      "Don\'t worry, just enter your phone number and we will send a verification code.",
    ),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "sendVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Send Verification Code",
    ),
    "verifyCode": MessageLookupByLibrary.simpleMessage("Verify Code"),
  };
}
