// import 'package:e_coomerce_fruit/constants.dart';
// import 'package:e_coomerce_fruit/core/helper_functions/get_user.dart';
// import 'package:e_coomerce_fruit/core/repos/images_repo/images_repo.dart';
// import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
// import 'package:e_coomerce_fruit/core/utils/app_images.dart';
// import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
// import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/profile_image_picker.dart';
// import 'package:flutter/material.dart';

// class ProfileViewBody extends StatelessWidget {
//   const ProfileViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
//       child: Column(
//         children: [
//           SizedBox(height: kTopPadding),
//           buildAppBar(
//             context,
//             title: 'حسابي',
//             showBackButton: false,
//             showNotification: false,
//           ),

//           Row(
//             children: [
//               // GestureDetector(
//               //   onTap: () async {
//               //     // استدعاء ميثود اختيار ورفع الصورة
//               //     final picker = ProfileImagePicker(getIt<ImagesRepo>());
//               //     await picker.pickAndUploadImage(context);
//               //   },
//               //   child: CircleAvatar(
//               //     radius: 27,
//               //     backgroundImage: getUserProfileImage().isNotEmpty
//               //         ? NetworkImage(getUserProfileImage())
//               //         : AssetImage(Assets.imagesProfileImage) as ImageProvider,
//               //   ),
//               // ),
//               CircleAvatar(child: Image.asset(Assets.imagesProfileImage)),
//               SizedBox(width: 24),

//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     getUser().name,
//                     style: TextStyles.bold13.copyWith(color: Color(0xff131F46)),
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     getUserEmail(),
//                     style: TextStyles.regular13.copyWith(
//                       color: Color(0xff888FA0),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// box 2
import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_user.dart';
import 'package:e_coomerce_fruit/core/repos/images_repo/images_repo.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/cubits/signout_cubit/signout_cubit_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_logout_dialog.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/profile_image_picker.dart';
import 'package:e_coomerce_fruit/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool notificationsEnabled = true; // Default on
  bool isDarkMode = false; // Default light mode

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Make scrollable for new content
      child: Padding(
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
                CircleAvatar(child: Image.asset(Assets.imagesProfileImage)),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getUser().name,
                      style: TextStyles.bold13.copyWith(
                        color: Color(0xff131F46),
                      ),
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
            SizedBox(height: 32), // Spacing before sections
            // Section: عام (General)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'عام',
                style: TextStyles.bold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person, color: AppColors.primaryColor),
              title: Text('الملف الشخصي', style: TextStyles.regular16),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                GoRouter.of(context).push(AppRouter.kPersonalInfoView);
              },
            ),
            Divider(color: Colors.grey.shade300),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: AppColors.primaryColor),
              title: Text('طلباتي', style: TextStyles.regular16),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to orders page (implement later)
              },
            ),
            Divider(color: Colors.grey.shade300),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet,
                color: AppColors.primaryColor,
              ),
              title: Text('المدفوعات', style: TextStyles.regular16),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to payments page (implement later)
              },
            ),
            Divider(color: Colors.grey.shade300),
            ListTile(
              leading: Icon(Icons.favorite, color: AppColors.primaryColor),
              title: Text('المفضلة', style: TextStyles.regular16),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to favorites page (implement later)
              },
            ),
            Divider(color: Colors.grey.shade300),
            ListTile(
              leading: Icon(Icons.notifications, color: AppColors.primaryColor),
              title: Text('الإشعارات', style: TextStyles.regular16),
              trailing: Switch(
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                  // Add logic to save preference (e.g., Prefs.setBool)
                },
                activeColor: AppColors.primaryColor,
              ),
            ),
            Divider(color: Colors.grey.shade300),
            ListTile(
              leading: Icon(Icons.language, color: AppColors.primaryColor),
              title: Text('اللغة', style: TextStyles.regular16),
              trailing: Text('العربية', style: TextStyles.regular13),
            ),
            Divider(color: Colors.grey.shade300),
            ListTile(
              leading: Icon(Icons.brightness_6, color: AppColors.primaryColor),
              title: Text('الوضع', style: TextStyles.regular16),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                  // Add logic to toggle theme (e.g., via provider)
                },
                activeColor: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 32), // Spacing before next section
            // Section: المساعدة (Help)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'المساعدة',
                style: TextStyles.bold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.info, color: AppColors.primaryColor),
              title: Text('من نحن', style: TextStyles.regular16),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                GoRouter.of(context).push(AppRouter.kAboutUs);
              },
            ),
            SizedBox(height: 32), // Spacing before logout
            // Logout Button
            CustomButton(
              text: 'تسجيل الخروج',
              onPressed: () {
                _showLogoutDialog(context);
                // Add logout logic: e.g., FirebaseAuth.instance.signOut(), clear prefs, navigate to signin
                // For now, show a snackbar
              },
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 32), // Bottom padding
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,

      barrierDismissible: false, // Matches your code

      builder: (context) => LogoutDialog(), // Use your custom dialog
    );
  }
}

