import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/circle_icon_button.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIconButton(
          iconColor: Colors.white,
          icon: Icons.add,
          onPressed: () {
            cartItemEntity.increasCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          color: AppColors.primaryColor,
        ),

        // 4 بدل 16: مساحة اللمس 48dp توفّر الفراغ البصري السابق
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            cartItemEntity.quantity.toString(),
            textAlign: TextAlign.center,
            style: TextStyles.bold16,
          ),
        ),
        CircleIconButton(
          iconColor: Colors.grey,
          icon: Icons.remove,
          onPressed: () {
            cartItemEntity.decreasCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          color: Color(0xFFF3F5F7),
        ),
      ],
    );
  }
}
