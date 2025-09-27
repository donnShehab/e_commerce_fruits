import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/helper_functions/app_router.dart';
import 'package:fruit_hub/feature/auth/presntation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/clickable_text_span.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/custom_button_social_media.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/on_divider.dart';
import 'package:fruit_hub/utils/app_colors.dart';
import 'package:fruit_hub/utils/app_images.dart';
import 'package:fruit_hub/utils/app_text_styles.dart';
import 'package:fruit_hub/widgets/custom_app_bar.dart';
import 'package:fruit_hub/widgets/custom_button.dart';
import 'package:fruit_hub/widgets/custom_password_field.dart';
import 'package:fruit_hub/widgets/custom_text_form_field.dart';

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
                CustomButton(
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

                CustomButtonSocialMediaa(
                  onPressed: () {
                    context.read<SigninCubit>().signInWithGoogle();
                  },
                  title: 'تسجيل بواسطة جوجل',
                  imageSocial: SvgPicture.asset(Assets.imagesGoogleIcon),
                ),
                SizedBox(height: 12),
                Platform.isIOS
                    ? Column(
                        children: [
                          CustomButtonSocialMediaa(
                            title: 'تسجيل بواسطة أبل',
                            imageSocial: SvgPicture.asset(Assets.imagesApplIcon),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(height: 12),

                CustomButtonSocialMediaa(
                  onPressed: () {
                    context.read<SigninCubit>().signInWithFacebook();
                  },
                  title: 'تسجيل بواسطة فيسبوك',
                  imageSocial: SvgPicture.asset(Assets.imagesFacebookIcon),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
