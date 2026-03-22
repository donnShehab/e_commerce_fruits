import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text.rich(
            textAlign: TextAlign.start,
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب، فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF8E9596),
                    height: 1.7,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.primaryColor,
                    height: 1.7,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(
                  text: ' الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF8E9596),
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
            widget.onChanged(isChecked);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            margin: const EdgeInsets.only(top: 2),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isChecked ? AppColors.primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isChecked
                    ? AppColors.primaryColor
                    : const Color(0xFFD7DBDC),
              ),
            ),
            child: isChecked
                ? const Icon(Icons.check_rounded, size: 18, color: Colors.white)
                : null,
          ),
        ),
      ],
    );
  }
}
