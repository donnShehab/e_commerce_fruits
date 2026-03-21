import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/services/shared_preferences_singleton.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/feature/on_boarding/presntation/view/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kVerticalPadding,
            horizontal: kHorizintalPadding,
          ),
          child: Visibility(
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            visible: currentPage == 1,
            child: CustomButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSigninView);
                Prefs.setBool(kIsOnBoardingViewSeen, true);
              },
              color: AppColors.primaryColor,
              text: 'ابدأ الآن',
            ),
          ),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
