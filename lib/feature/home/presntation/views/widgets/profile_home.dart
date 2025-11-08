import 'package:e_coomerce_fruit/core/helper_functions/get_user.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_notification.dart';
import 'package:flutter/material.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesProfileImage, width: 54, height: 54),
        SizedBox(width: 11),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'صباح الخير ..!',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff949D9E),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 4),
            Text(getUser().name, style: TextStyles.bold16),
          ],
        ),
        Spacer(), // ✅ خليه يوزع المسافة
        CustomNofitication(),
      ],
    );
  }
}
