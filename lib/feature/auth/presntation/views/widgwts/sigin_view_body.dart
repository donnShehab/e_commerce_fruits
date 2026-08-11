import 'dart:io';

import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/core/widgets/app_button.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_password_field.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_text_form_field.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/cubits/signin_cubits/signin_cubit.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/clickable_text_span.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/on_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'التسجيل الدخول '),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                SizedBox(height: 24),

                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),

                CustomPasswordField(
                  
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {},

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kForgetPassword);
                        },
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.lightPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 33),
                AppButton.filled(
                  text: 'تسجيل دخول',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SigninCubit>().Signin(email, password);
                    }
                  },
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: 33),

                ClickableTextSpan(
                  gestureRecognizer: TapGestureRecognizer()
                    ..onTap = () {
                      GoRouter.of(context).push(AppRouter.kSignupView);
                    },
                  text1: 'لا تمتلك حساب ؟',
                  text2: 'قم بإنشاء حساب',
                ),
                SizedBox(height: 33),
                OrDivider(),
                SizedBox(height: 16),

                AppButton.outlined(
                  onPressed: () {
                    context.read<SigninCubit>().signInWithGoogle();
                  },
                  text: 'تسجيل بواسطة جوجل',
                  leading: SvgPicture.asset(Assets.imagesGoogleIcon),
                ),
                SizedBox(height: 12),
                Platform.isIOS
                    ? Column(
                        children: [
                          AppButton.outlined(
                            onPressed: null,
                            text: 'تسجيل بواسطة أبل',
                            leading: SvgPicture.asset(Assets.imagesApplIcon),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(height: 12),

                AppButton.outlined(
                  onPressed: () {
                    context.read<SigninCubit>().signInWithFacebook();
                  },
                  text: 'تسجيل بواسطة فيسبوك',
                  leading: SvgPicture.asset(Assets.imagesFacebookIcon),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
