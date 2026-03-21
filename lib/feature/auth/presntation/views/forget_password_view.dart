import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/helper_functions/app_router.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

import 'package:go_router/go_router.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'نسيان كلمة المرور'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 24),
            Text(
              'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
              style: TextStyles.semiBold16.copyWith(color: Color(0xff616A6B)),
            ),
            SizedBox(height: 31),
            CustomTextFormField(
              hintText: '+962 79 813 851 2',
              textInputType: TextInputType.phone,
              textDirection: TextDirection.ltr,
            ),
            SizedBox(height: 31),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kOtpPassword);
              },
              text: 'نسيت كلمة المرور',
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

// class BoxOtp extends StatelessWidget {
//   const BoxOtp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 75,
//       width: 60,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         border: Border.all(width: 1, color: Color(0xffE6E9EA)),
//       ),
//       child: TextField(
//       keyboardType: TextInputType.phone,
//       ),
//     );
//   }
// }
