import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/helper_functions/showSuccessSnackBar.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_password_field.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/repos/auth_repos.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/cubits/reset_password/reset_password_cubit.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/clickable_text_span.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/validate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OtpPasswordView extends StatefulWidget {
  const OtpPasswordView({super.key});

  @override
  State<OtpPasswordView> createState() => _OtpPasswordViewState();
}

class _OtpPasswordViewState extends State<OtpPasswordView> {
  final List<TextEditingController> _controllers = List.generate(
    6, // تغيير من 4 إلى 6
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (_) => FocusNode(),
  ); // تغيير من 4 إلى 6
  late String verificationId;
  late String newPassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    verificationId = GoRouterState.of(context).extra as String;
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String getOtp() => _controllers.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          showBackButton: true,
          showNotification: false,
          context,
          title: 'التحقق من الرمز',
        ),
        body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
             showSuccessSnackBar(context, 'تم إعادة تعيين كلمة المرور بنجاح');
              GoRouter.of(context).push(AppRouter.kSigninView);
            }
            if (state is ResetPasswordFailure) {
            showSuccessSnackBar(context, state.message);
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
                  children: [
                    SizedBox(height: 24),
                    Text(
                      'أدخل الرمز الذي أرسلناه إلى رقم هاتفك',
                      style: TextStyles.semiBold16,
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6, // تغيير من 4 إلى 6
                        (index) => _buildOtpTextField(index),
                      ),
                    ),
                    SizedBox(height: 24),
                    CustomPasswordField(
                      onSaved: (value) {
                        newPassword = value!;
                      },
                      hintText: 'كلمة المرور الجديدة',
                      validator: Validate.password,
                    ),
                    SizedBox(height: 24),
                    CustomButton(
                      text: 'إعادة تعيين كلمة المرور',
                      onPressed: state is ResetPasswordLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate() &&
                                  getOtp().length == 6) {
                                // تغيير من 4 إلى 6
                                formKey.currentState!.save();
                                context
                                    .read<ResetPasswordCubit>()
                                    .verifyOtpAndResetPassword(
                                      verificationId,
                                      getOtp(),
                                      newPassword,
                                    );
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(height: 24),
                    ClickableTextSpan(
                      text2: 'إعادة إرسال الرمز',
                      gestureRecognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // يمكن إضافة منطق إعادة الإرسال هنا
                        },
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

  Widget _buildOtpTextField(int index) {
    return Container(
      width: 50, // قلل العرض قليلاً ليتناسب مع 6 حقول (كان 60)
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: _controllers[index].text.isNotEmpty
              ? AppColors.primaryColor
              : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        onChanged: (value) {
          if (value.length == 1 && index < 5) {
            // تغيير من 3 إلى 5 (لأن الفهرس يبدأ من 0، والحقل الأخير هو 5)
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(border: InputBorder.none),
        style: TextStyles.semiBold16,
      ),
    );
  }
}
