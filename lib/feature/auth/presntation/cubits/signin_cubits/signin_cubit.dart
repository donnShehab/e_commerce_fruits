import 'package:bloc/bloc.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/entites/user_entity.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/repos/auth_repos.dart';

import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> Signin(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SigninFailure(failure: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SigninFailure(failure: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SigninFailure(failure: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }
}
