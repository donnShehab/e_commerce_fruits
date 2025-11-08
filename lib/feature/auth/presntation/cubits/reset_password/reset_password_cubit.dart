import 'package:bloc/bloc.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/repos/auth_repos.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());
  final AuthRepo authRepo;

  // إرسال OTP بناءً على رقم الهاتف
  Future<void> sendOtp(String phoneNumber) async {
    emit(ResetPasswordLoading());
    final result = await authRepo.sendOtpForPasswordReset(phoneNumber);
    result.fold(
      (failure) => emit(ResetPasswordFailure(message: failure.message)),
      (verificationId) => emit(OtpSent(verificationId: verificationId)),
    );
  }

  // التحقق من OTP وإعادة تعيين كلمة المرور
  Future<void> verifyOtpAndResetPassword(
    String verificationId,
    String otp,
    String newPassword,
  ) async {
    emit(ResetPasswordLoading());
    final result = await authRepo.verifyOtpAndResetPassword(
      verificationId,
      otp,
      newPassword,
    );
    result.fold(
      (failure) => emit(ResetPasswordFailure(message: failure.message)),
      (userEntity) => emit(ResetPasswordSuccess()),
    );
  }
}
