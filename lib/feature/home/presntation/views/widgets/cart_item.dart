import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_item_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdate) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        log('we are building this widget');

        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                height: 100,
                width: 89,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: cartItemEntity.productEntity.imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: CachedNetworkImage(
                          imageUrl: cartItemEntity.productEntity.imageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error_outline),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.image, color: Colors.white),
                      ),
              ),

              const SizedBox(width: 17),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13.copyWith(
                            color: const Color(0xFF1A1A1A),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCartItem(
                              cartItemEntity,
                            );
                          },
                          child: iconsTrash(),
                        ),
                      ],
                    ),
                    Text(
                      '${cartItemEntity.calculateToWeight()} كجم',
                      style: TextStyles.regular13.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF8D9B8F),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: cartItemEntity),
                        const Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} دينار',
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class iconsTrash extends StatelessWidget {
  const iconsTrash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5EC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.imagesTrash,
          width: 20,
          height: 20,
          color: const Color.fromARGB(255, 211, 106, 0),
        ),
      ),
    );
  }
}
