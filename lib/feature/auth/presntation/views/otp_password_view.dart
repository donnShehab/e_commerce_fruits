import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/helper_functions/app_router.dart';
import 'package:fruit_hub/feature/auth/presntation/views/widgwts/clickable_text_span.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';

import 'package:go_router/go_router.dart';

class OtpPasswordView extends StatelessWidget {
  const OtpPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'التحقق من الرمز'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            Text(
              'أدخل الرمز الذي أرسلناه إلى عنوان بريد التاليMaxxx@email.com',
              style: TextStyles.semiBold16,
            ),
            SizedBox(height: 24),

            // i need creat 4 box textfield examole otp in facebook or watsapp 4 squre and where enter number code next to squre and chang color index squre can u hel me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOtpTextField(context),
                _buildOtpTextField(context),
                _buildOtpTextField(context),
                _buildOtpTextField(context),
              ],
            ),
            SizedBox(height: 24),
            CustomButton(
              text: 'تحقق من الرمز',
              onPressed: () {},
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 24),
            ClickableTextSpan(
              text2: 'إعادة إرسال الرمز',
              gestureRecognizer: TapGestureRecognizer()
                ..onTap = () {
                  GoRouter.of(context).push(AppRouter.kOtpPassword);
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpTextField(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],

        decoration: InputDecoration(border: InputBorder.none, hintText: '0'),
        style: TextStyles.semiBold16,
      ),
    );
  }
}
