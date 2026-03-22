import 'package:animate_do/animate_do.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyCartAnimationWidget extends StatelessWidget {
  const EmptyCartAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInUp(
        duration: const Duration(milliseconds: 700),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Bounce(
                infinite: true,
                duration: const Duration(seconds: 2),
                child: Container(
                  width: 132,
                  height: 132,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4E8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 68,
                    color: Color(0xFFF57C00),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'سلتك فارغة حاليًا',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2B2B2B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'ابدأ التسوق وأضف منتجاتك المفضلة لتظهر هنا بسهولة.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  height: 1.7,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: () {
                  GoRouter.of(context).go(AppRouter.kHomeView);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 15,
                  ),
                ),
                icon: const Icon(
                  Icons.storefront_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'ابدأ التسوق',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
