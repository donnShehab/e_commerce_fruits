import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/services/shared_preferences_singleton.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subTitle,
    required this.title,
    this.isVisibility = false,
  });

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisibility;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: screenHeight * .55,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 7,
                left: -30,
                right: -30,
                child: Center(
                  child: Image.asset(
                    image,
                    height: screenHeight * .40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Visibility(
                visible: isVisibility,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kSigninView);
                          Prefs.setBool(kIsOnBoardingViewSeen, true);
                        },
                        child: Text(
                          'تخطي',
                          style: TextStyles.regular13.copyWith(
                            color: const Color(0xFF7A7A7A),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: title,
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xFF4E5556),
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
