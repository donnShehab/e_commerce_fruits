import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFE2E5E7), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'أو',
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xFF9AA1A1),
            ),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFFE2E5E7), thickness: 1)),
      ],
    );
  }
}
