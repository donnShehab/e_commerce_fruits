import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/widgets/app_button.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        final cartEntity = context.watch<CartCubit>().cartEntity;

        // السلة فارغة → لا زر. حالة الفراغ لديها زر "ابدأ التسوق" الخاص بها
        if (cartEntity.cartItems.isEmpty) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: AppButton.filled(
            text: 'الدفع ${cartEntity.calculateTotalPrice()} دينار',
            onPressed: () {
              context.push(AppRouter.kCheckout, extra: cartEntity);
            },
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
