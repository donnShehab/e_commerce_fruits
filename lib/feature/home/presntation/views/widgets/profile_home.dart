import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_user.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_notification.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to profile view
            GoRouter.of(context).push(AppRouter.kProfileView);
          },
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFF57C00), width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                Assets.imagesProfileAlwadi2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
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
