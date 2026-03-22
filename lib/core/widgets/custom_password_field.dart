import 'package:e_coomerce_fruit/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.onSaved,
    this.validator,
    this.hintText,
  });

  final String? hintText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      validator: widget.validator,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: const Color(0xFFB8BDBE),
        ),
      ),
      hintText: widget.hintText ?? 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
