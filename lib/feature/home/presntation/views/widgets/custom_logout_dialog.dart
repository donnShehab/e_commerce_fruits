import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/cubits/signout_cubit/signout_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // RTL support

      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              // Close Icon (top left)
              Align(
                alignment: Alignment.topRight,

                child: GestureDetector(
                  onTap: () => Navigator.pop(context),

                  child: Icon(Icons.close, size: 24),
                ),
              ),

              SizedBox(height: 10),

              // Question
              Text(
                "هل ترغب في تسجيل الخروج؟",

                style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
              ),

              SizedBox(height: 25),

              // Buttons Row
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.only(
                          top: 15,
                          right: 8,
                          bottom: 15,
                          left: 8,
                        ),

                        side: BorderSide(color: AppColors.primaryColor),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      child: Text(
                        "لا أرغب",

                        style: TextStyles.bold16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 15),

                  // Confirm Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context); // Close dialog

                        await getIt<SignoutCubitCubit>()
                            .logout(); // Your logout logic

                        GoRouter.of(
                          context,
                        ).go(AppRouter.kSigninView); // Navigate to signin

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم تسجيل الخروج')),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor, // Dark green

                        padding: EdgeInsets.only(
                          top: 15,
                          right: 8,
                          bottom: 15,
                          left: 8,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      child: Text(
                        "تأكيد",

                        style: TextStyles.bold16.copyWith(
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
