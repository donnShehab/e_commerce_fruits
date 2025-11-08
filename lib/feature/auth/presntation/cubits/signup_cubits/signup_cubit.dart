import 'package:dartz/dartz.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/repos/auth_repos.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/cubits/signup_cubits/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String? phoneNumber,

  ) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
      phoneNumber,
    );
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
