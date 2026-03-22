import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/build_error_bar.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/phone_utils.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_password_field.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_text_form_field.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/cubits/signup_cubits/signup_cubit.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/clickable_text_span.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/terms_and_conditions_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  late bool isTermsAccepted = false;
  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حساب جديد', showNotification: false),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Form(
            key: fromKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(height: 14),

                CustomTextFormField(
                  onSaved: (value) {
                    userName = value!;
                  },
                  hintText: 'الاسم الكامل',
                  textInputType: TextInputType.text,
                ),

                const SizedBox(height: 16),

                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),

                CustomPasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),

                const SizedBox(height: 16),

                CustomTextFormField(
                  onSaved: (value) {
                    phoneNumber = formatPhoneForFirebase(value!);
                  },
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.phone,
                  textDirection: TextDirection.ltr,
                ),

                const SizedBox(height: 18),

                TermsAndConditionsWidget(
                  onChanged: (value) {
                    isTermsAccepted = value;
                  },
                ),

                const SizedBox(height: 28),

                CustomButton(
                  color: AppColors.primaryColor,
                  onPressed: () {
                    if (fromKey.currentState!.validate()) {
                      fromKey.currentState!.save();
                      if (isTermsAccepted) {
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                              email,
                              password,
                              userName,
                              phoneNumber,
                            );
                      } else {
                        showBar(
                          context,
                          'يجب عليك الموافقة على الشروط والأحكام',
                        );
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'إنشاء حساب جديد',
                ),

                const SizedBox(height: 28),

                Center(
                  child: ClickableTextSpan(
                    gestureRecognizer: TapGestureRecognizer()
                      ..onTap = () {
                        GoRouter.of(context).pop();
                      },
                    text1: 'لديك حساب بالفعل؟ ',
                    text2: 'تسجيل دخول',
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
