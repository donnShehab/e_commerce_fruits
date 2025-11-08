import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/helper_functions/build_error_bar.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
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
        return CustomButton(
          text:
              'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} دينار',
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              context.push(
                AppRouter.kCheckout,
                extra: context.read<CartCubit>().cartEntity,
              );
            } else {
              showBar(context, 'لا يوجد منتجات في السلة');
            }
          },
          color: AppColors.primaryColor,
        );
      },
    );
  }
}
