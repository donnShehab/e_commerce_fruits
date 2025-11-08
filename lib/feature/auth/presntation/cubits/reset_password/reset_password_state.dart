part of 'reset_password_cubit.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class OtpSent extends ResetPasswordState {
  final String verificationId;
  OtpSent({required this.verificationId});
}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordFailure extends ResetPasswordState {
  final String message;
  ResetPasswordFailure({required this.message});
}
