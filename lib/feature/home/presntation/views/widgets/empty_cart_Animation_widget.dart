import 'package:animate_do/animate_do.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyCartAnimationWidget extends StatelessWidget {
  const EmptyCartAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInUp(
        duration: const Duration(milliseconds: 800),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 حركة عربة التسوق
            Bounce(
              infinite: true,
              duration: const Duration(seconds: 2),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 100,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 النص الرئيسي
            Text(
              'سلتك فارغة حالياً 🛒',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 النص الثانوي
            Text(
              'ابدأ التسوق وأضف منتجاتك المفضلة الآن!',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 🔹 زر للعودة إلى الصفحة الرئيسية
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AppButton.filled(
                onPressed: () {
                  GoRouter.of(context).go(AppRouter.kHomeView);
                },
                color: AppColors.primaryColor,
                leading: const Icon(Icons.storefront, color: Colors.white),
                text: 'ابدأ التسوق',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
