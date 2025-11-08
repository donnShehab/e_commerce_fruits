import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ActiveItemStep extends StatelessWidget {
  const ActiveItemStep({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.check, size: 18, color: Colors.white),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
