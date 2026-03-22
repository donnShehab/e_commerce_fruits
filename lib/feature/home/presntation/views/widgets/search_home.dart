import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kSearchView),
      child: Container(
        height: 54,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color.fromARGB(255, 253, 180, 107),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF4E8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesSetting4,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'ابحث عن منتج',
                textAlign: TextAlign.right,
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF9AA1A1),
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(width: 12),
            SvgPicture.asset(
              Assets.imagesSearchNormal,
              width: 22,
              height: 22,
              color: AppColors.lightPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
