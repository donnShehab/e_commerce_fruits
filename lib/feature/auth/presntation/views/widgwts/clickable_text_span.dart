
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class ClickableTextSpan extends StatelessWidget {
  const ClickableTextSpan({
    super.key,
     this.text1,
    required this.text2,
    required this.gestureRecognizer,
  });
  final String ?text1;
  final String text2;
  final GestureRecognizer gestureRecognizer;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyles.semiBold16.copyWith(color: Color(0xff949D9E)),
          ),
          TextSpan(
            recognizer: gestureRecognizer,
            text: text2,
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
