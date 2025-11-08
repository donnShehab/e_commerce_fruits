import 'package:e_coomerce_fruit/feature/auth/domain/entites/user_entity.dart';

abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

final class SignupFailure extends SignupState {
  final String message;

  SignupFailure({required this.message});
}
