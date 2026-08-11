import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // اجعلها nullable للسماح بتعطيل الزر
  final Color color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color, // اجعلها required لضمان وجود لون دائمًا
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: onPressed != null
            ? color
            : color.withOpacity(0.5), // أضف opacity عند التعطيل
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: onPressed, // TextButton يدعم null تلقائيًا
        style: TextButton.styleFrom(
          foregroundColor: Colors.white, // لون النص
          padding: EdgeInsets.zero, // إزالة padding الافتراضي لـ TextButton
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // مطابقة borderRadius
          ),
        ),
        child: Text(
          text,
          style: TextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
