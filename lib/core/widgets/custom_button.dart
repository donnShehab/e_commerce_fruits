import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
     this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(16),
      ),

      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
