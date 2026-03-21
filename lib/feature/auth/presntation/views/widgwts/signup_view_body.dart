import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hub/feature/auth/presntation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruit_hub/feature/auth/presntation/views/widgwts/clickable_text_span.dart';
import 'package:fruit_hub/feature/auth/presntation/views/widgwts/terms_and_conditions_widget.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_password_field.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: ' حساب جديد'),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Form(
            key: fromKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    userName = value!;
                  },
                  hintText: 'الاسم الكامل ',

                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                CustomPasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                SizedBox(height: 16),
                TermsAndConditionsWidget(
                  onChanged: (value) {
                    isTermsAccepted = value;
                  },
                ),
                SizedBox(height: 30),
                 CustomButton(
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
                            );
                      } else {
                        showBar(
                          context,
                          'يجب عليك الموافقة على الشروط والإحكام',
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

                SizedBox(height: 26),
                Align(
                  alignment: Alignment.center,
                  child: ClickableTextSpan(
                    gestureRecognizer: TapGestureRecognizer()
                      ..onTap = () {
                        GoRouter.of(context).pop();
                      },
                    text1: 'تمتلك حساب بالفعل؟',
                    text2: 'تسجيل دخول',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
