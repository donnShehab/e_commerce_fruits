import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/app_router.dart';
import 'package:fruit_hub/utils/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class SectionHeaderBestSeller extends StatelessWidget {

  const SectionHeaderBestSeller({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('الاكثر مبيعًا',style: TextStyles.bold16),
        const Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMoreProductView);
          },
          child: Text(
            'المزيد',
            style: TextStyles.regular13.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
