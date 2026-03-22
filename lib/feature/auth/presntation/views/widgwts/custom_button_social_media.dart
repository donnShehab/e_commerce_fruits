import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonSocialMediaa extends StatelessWidget {
  const CustomButtonSocialMediaa({
    super.key,
    required this.imageSocial,
    required this.title,
    this.onPressed,
  });

  final SvgPicture imageSocial;
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFFE1E4E6), width: 1),
          ),
        ),
        child: Row(
          children: [
            imageSocial,
            const Spacer(),
            Text(
              title,
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xFF1A1A1A),
              ),
            ),
            const Spacer(),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
