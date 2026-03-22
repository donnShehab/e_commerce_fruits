import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_Item_action_circual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF1E5D8), width: 1),
      ),
      child: Row(
        children: [
          CartItemActionCircual(
            iconColor: Colors.white,
            icon: Icons.add,
            onPressed: () {
              cartItemEntity.increasCount();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
            color: AppColors.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              cartItemEntity.quantity.toString(),
              textAlign: TextAlign.center,
              style: TextStyles.bold16.copyWith(color: const Color(0xFF1A1A1A)),
            ),
          ),
          CartItemActionCircual(
            iconColor: const Color(0xFFB3B3B3),
            icon: Icons.remove,
            onPressed: () {
              cartItemEntity.decreasCount();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
            color: const Color(0xFFF1F1F1),
          ),
        ],
      ),
    );
  }
}
