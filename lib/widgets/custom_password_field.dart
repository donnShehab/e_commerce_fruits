import 'package:flutter/material.dart';
import 'package:fruit_hub/widgets/custom_text_form_field.dart';


class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

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
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? const Icon(Icons.remove_red_eye, color: Color(0xffC9CECF))
            : const Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
      ),
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
