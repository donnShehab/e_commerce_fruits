import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.textDirection,
    this.validator,
  });

  final String? initialValue;
  final TextDirection? textDirection;
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textDirection: textDirection,
      obscureText: obscureText,
      onSaved: onSaved,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
      keyboardType: textInputType,
      style: TextStyles.semiBold16.copyWith(color: const Color(0xFF1A1A1A)),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyles.semiBold16.copyWith(
          color: const Color(0xFF9AA1A1),
        ),
        filled: true,
        fillColor: const Color(0xFFFDFDFD),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildFocusedBorder(),
        errorBorder: buildErrorBorder(),
        focusedErrorBorder: buildErrorBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 1, color: Color(0xFFE3E6E8)),
    );
  }

  OutlineInputBorder buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 1.2, color: Color(0xFFF57C00)),
    );
  }

  OutlineInputBorder buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 1, color: Color(0xFFD32F2F)),
    );
  }
}
