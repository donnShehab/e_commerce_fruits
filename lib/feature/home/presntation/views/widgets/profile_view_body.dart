import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_user.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: Column(
        children: [
          SizedBox(height: kTopPadding),
          Row(
            children: [
              CircleAvatar(child: Image.asset(Assets.imagesProfileImage)),
              SizedBox(width: 24),

              // Expanded: البريد الطويل يقصّ بدل أن يسبب overflow
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getUser().name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.bold13.copyWith(
                        color: Color(0xff131F46),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      getUserEmail(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.regular13.copyWith(
                        color: Color(0xff888FA0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
