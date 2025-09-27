import 'package:flutter/material.dart';
import 'package:fruit_hub/utils/app_images.dart';
import 'package:fruit_hub/utils/app_text_styles.dart';

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
            Text('شهاب الصعيدي', style: TextStyles.bold16),
          ],
        ),
        Spacer(), // ✅ خليه يوزع المسافة
        CustomNofitication(),
      ],
    );
  }
}

class CustomNofitication extends StatelessWidget {
  const CustomNofitication({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color(0xffEEF8ED),
      ),
      child: Center(
        child: Stack(
          children: [
            Icon(Icons.notifications_none, size: 34),
            Positioned(
              right: 14,
              top: 4,
              child: Container(
                height: 7,

                width: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
