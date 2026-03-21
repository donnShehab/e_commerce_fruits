import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity, // يخلي TextField يتمدد
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'ابحث عن ......',
          hintStyle: TextStyles.regular13.copyWith(
            color: Color(0xff949D9E),
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child: SvgPicture.asset(
              Assets.imagesSearchNormal,
              height: 24,
              width: 24,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child: SvgPicture.asset(
              Assets.imagesSetting4,
              width: 40,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
