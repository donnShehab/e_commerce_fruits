import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });
  final String text, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: StepItemContent(isActive: false, index: index, text: text),
      secondChild: StepItemContent(isActive: true, index: index, text: text),
      crossFadeState: isActive
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
    );
  }
}

class StepItemContent extends StatelessWidget {
  const StepItemContent({
    super.key,
    required this.isActive,
    required this.index,
    required this.text,
  });
  final bool isActive;
  final String index, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: isActive
              ? AppColors.primaryColor
              : const Color(0xffF2F3F3),
          child: isActive
              ? const Icon(Icons.check, size: 18, color: Colors.white)
              : Text(
                  index,
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xff0C0D0D),
                  ),
                ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: isActive
              ? TextStyles.bold13.copyWith(color: AppColors.primaryColor)
              : TextStyles.semiBold16.copyWith(color: const Color(0xffAAAAAA)),
        ),
      ],
    );
  }
}
