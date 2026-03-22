import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            'تسوّق الآن',
            style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
