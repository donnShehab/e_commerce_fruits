import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class InActiveItemStep extends StatelessWidget {
  const InActiveItemStep({super.key, required this.index, required this.text});
  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Color(0xffF2F3F3),
          child: Text(
            index,
            style: TextStyles.semiBold13.copyWith(color: Color(0xff0C0D0D)),
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyles.semiBold16.copyWith(color: Color(0xffAAAAAA)),
        ),
      ],
    );
  }
}
