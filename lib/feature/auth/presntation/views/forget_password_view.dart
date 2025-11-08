import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/utils/phone_utils.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_text_form_field.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/repos/auth_repos.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/cubits/reset_password/reset_password_cubit.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'نسيان كلمة المرور'),
        body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is OtpSent) {
              // انتقل إلى صفحة OTP مع تمرير verificationId
              GoRouter.of(context).push(
                AppRouter.kOtpPassword,
                extra: state.verificationId, // تمرير verificationId
              );
            }
            if (state is ResetPasswordFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizintalPadding,
              ),
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 24),
                    Text(
                      'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
                      style: TextStyles.semiBold16.copyWith(
                        color: Color(0xff616A6B),
                      ),
                    ),
                    SizedBox(height: 31),
                    CustomTextFormField(
                      onSaved: (value) {
                        phoneNumber = formatPhoneForFirebase(value!);
                      },
                      hintText: '+962 79 813 851 2',
                      textInputType: TextInputType.phone,
                      textDirection: TextDirection.ltr,
                      validator: Validate.phoneNumber,
                    ),
                    SizedBox(height: 31),
                    CustomButton(
                      onPressed: state is ResetPasswordLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context.read<ResetPasswordCubit>().sendOtp(
                                  phoneNumber,
                                );
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                      text: 'إرسال رمز التحقق',
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
