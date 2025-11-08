import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_user.dart';
import 'package:e_coomerce_fruit/core/repos/images_repo/images_repo.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/profile_image_picker.dart';
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
          buildAppBar(
            context,
            title: 'حسابي',
            showBackButton: false,
            showNotification: false,
          ),

          Row(
            children: [
              // GestureDetector(
              //   onTap: () async {
              //     // استدعاء ميثود اختيار ورفع الصورة
              //     final picker = ProfileImagePicker(getIt<ImagesRepo>());
              //     await picker.pickAndUploadImage(context);
              //   },
              //   child: CircleAvatar(
              //     radius: 27,
              //     backgroundImage: getUserProfileImage().isNotEmpty
              //         ? NetworkImage(getUserProfileImage())
              //         : AssetImage(Assets.imagesProfileImage) as ImageProvider,
              //   ),
              // ),
              CircleAvatar(child: Image.asset(Assets.imagesProfileImage)),
              SizedBox(width: 24),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getUser().name,
                    style: TextStyles.bold13.copyWith(color: Color(0xff131F46)),
                  ),
                  SizedBox(height: 2),
                  Text(
                    getUserEmail(),
                    style: TextStyles.regular13.copyWith(
                      color: Color(0xff888FA0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
