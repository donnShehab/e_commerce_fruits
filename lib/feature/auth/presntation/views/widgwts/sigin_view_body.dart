import 'dart:io';

import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_password_field.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_text_form_field.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/cubits/signin_cubits/signin_cubit.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/clickable_text_span.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/custom_button_social_media.dart';
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
      appBar: buildAppBar(
        context,
        title: 'تسجيل الدخول',
        showNotification: false,
        showBackButton: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                Image.asset(
                  Assets.imagesAlwadiLogo,
                  width: 200,
                  fit: BoxFit.contain,
                ),

                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 12),

                CustomPasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
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
                ),

                const SizedBox(height: 16),

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

                const SizedBox(height: 24),

                Center(
                  child: ClickableTextSpan(
                    gestureRecognizer: TapGestureRecognizer()
                      ..onTap = () {
                        GoRouter.of(context).push(AppRouter.kSignupView);
                      },
                    text1: 'لا تمتلك حساب؟ ',
                    text2: 'قم بإنشاء حساب',
                  ),
                ),

                const SizedBox(height: 24),

                const OrDivider(),

                const SizedBox(height: 18),

                CustomButtonSocialMediaa(
                  onPressed: () {
                    context.read<SigninCubit>().signInWithGoogle();
                  },
                  title: 'تسجيل بواسطة جوجل',
                  imageSocial: SvgPicture.asset(Assets.imagesGoogleIcon),
                ),

                const SizedBox(height: 12),

                Platform.isIOS
                    ? Column(
                        children: [
                          CustomButtonSocialMediaa(
                            title: 'تسجيل بواسطة أبل',
                            imageSocial: SvgPicture.asset(
                              Assets.imagesApplIcon,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      )
                    : const SizedBox(),

                CustomButtonSocialMediaa(
                  onPressed: () {
                    context.read<SigninCubit>().signInWithFacebook();
                  },
                  title: 'تسجيل بواسطة فيسبوك',
                  imageSocial: SvgPicture.asset(Assets.imagesFacebookIcon),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
