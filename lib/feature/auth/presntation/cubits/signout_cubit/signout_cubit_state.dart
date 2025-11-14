part of 'signout_cubit_cubit.dart';

abstract class SignoutCubitState extends Equatable {
  const SignoutCubitState();

  @override
  List<Object> get props => [];
}

class SignoutCubitInitial extends SignoutCubitState {}

class SignoutLoading extends SignoutCubitState {}

class SignoutSuccess extends SignoutCubitState {}

class SignoutError extends SignoutCubitState {
  final String message;
  const SignoutError({required this.message});
}
