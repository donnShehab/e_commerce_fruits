import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/on_boarding/presntation/widgets/page_view_item.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

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
          image: Assets.pageOne,
          backgroundImage: Assets.imagesOnBoardingBackground1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("  مرحبًا بك في", style: TextStyles.bold23),
              Text(
                " HUB",
                style: TextStyles.bold23.copyWith(
                  color: AppColors.secondryColor,
                ),
              ),

              Text(
                "Fruit",
                style: TextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        PageViewItem(
          image: Assets.pageTwo,
          backgroundImage: Assets.imagesOnBoardingBackground2,
          title: Text('ابحث وتسوق', style: TextStyles.bold23),

          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
