import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/on_boarding/presntation/view/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisibility: true,
          image: Assets.imagesOnBoardingAlwadiOne,
          backgroundImage: Assets.imagesOnBoardingAlwadiBackgroundOne,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'مرحبًا بك في ',
                  style: TextStyles.bold23.copyWith(
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                TextSpan(
                  text: 'ALWADI ',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: 'GO',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.secondryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          subTitle:
              'اكتشف منتجات الوادي بكل سهولة، من الأصناف المجمدة عالية الجودة إلى العروض المميزة، بتجربة تسوق سريعة وواضحة تناسب احتياجاتك اليومية.',
        ),
        PageViewItem(
          image: Assets.imagesOnBoardingAlwadiTwo,
          backgroundImage: Assets.imagesOnBoardingAlwadiBackgroundTwo,
          title: Text(
            'ابحث وتسوق',
            style: TextStyles.bold23,
            textAlign: TextAlign.center,
          ),
          subTitle:
              'تصفح منتجاتك المفضلة، اطّلع على التفاصيل والصور، واختر ما يناسبك بسهولة مع تجربة طلب مريحة وتوصيل موثوق.',
        ),
      ],
    );
  }
}
