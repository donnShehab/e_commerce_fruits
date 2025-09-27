import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/utils/app_images.dart';
import 'package:fruit_hub/utils/app_text_styles.dart';

class OffersHome extends StatelessWidget {
  const OffersHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            SvgPicture.asset(Assets.imagesEllipseGreen),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizintalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'عروض العيد',
                    style: TextStyles.regular13.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'خصم 25%',
                    style: TextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 34,
                    width: 116,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'تسوق الان',
                        style: TextStyles.bold13.copyWith(
                          color: Color(0xff1B5E37),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
