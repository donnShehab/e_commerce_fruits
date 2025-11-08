import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

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
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
